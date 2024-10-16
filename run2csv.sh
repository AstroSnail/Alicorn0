set -eu
usage="Usage: $0 <in|out> [iterations]"
usage_extended="${usage}
default iterations: 3"
env=${1?${usage}}
iterations=${2-3}

run2csv () {
	date=$(date -Is)
	i=0
	while [ $((i=i+1)) -le "${iterations}" ]
	do "$@" runtest.lua
	done | awk -f run2csv.awk \
		> "run2csv_${date}_${iterations} iterations_$*.csv"
}

wombocombo () (
	toggle=${1}
	shift
	if [ "${toggle}" = -- ]
	then "$@"
	else
		wombocombo "$@"
		wombocombo "$@" "${toggle}"
	fi
)

case ${env} in
	(in)
		#run2csv luajit # covered by wombocombo
		run2csv luajit -joff
		wombocombo -Omaxtrace=10000 -Omaxmcode=4096 -Orecunroll=5 \
			-Oloopunroll=60 -- run2csv luajit
		run2csv luvit
		;;
	(out)
		run2csv lua
		;;
	(*)
		echo "${usage_extended}"
		exit 1
		;;
esac
