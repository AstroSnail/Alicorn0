function mean(n, samples, sum, i) {
	sum = 0
	for (i = 1; i <= n; i++) {
		sum += samples[i]
	}
	return sum / n
}

BEGIN {
	iterations = 1
	printf "%s,%s,%s,%s,%s,%s,%s\n",
		"Iteration", "Total", "Format", "Syntax", "Typecheck",
		"Evaluation", "Execution"
}

/^Parsed!/     { format[iterations]     = $3 }
/^Got a term!/ { syntax[iterations]     = $5 }
/^Inferred!/   { typecheck[iterations]  = $3 }
/^Evaluated!/  { evaluation[iterations] = $3 }
/^Executed!/   { execution[iterations]  = $3 }
/^Runtest succeeded/ {
	total[iterations] = $4
	printf "%d,%.3f,%.3f,%.3f,%.3f,%.3f,%.3f\n",
		iterations, total[iterations], format[iterations],
		syntax[iterations], typecheck[iterations],
		evaluation[iterations], execution[iterations]
	iterations += 1
}

END {
	iterations -= 1
	format_mean = mean(iterations, format)
	syntax_mean = mean(iterations, syntax)
	typecheck_mean = mean(iterations, typecheck)
	evaluation_mean = mean(iterations, evaluation)
	execution_mean = mean(iterations, execution)
	total_mean = mean(iterations, total)
	printf "%s,%.3f,%.3f,%.3f,%.3f,%.3f,%.3f\n",
		"Mean", total_mean, format_mean, syntax_mean, typecheck_mean,
		evaluation_mean, execution_mean
}
