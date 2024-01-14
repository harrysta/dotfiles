#!/bin/sh


EXPR='<span data-testid="TemperatureValue" class="CurrentConditions--tempValue--MHmYY">.*</span></span>'

FAR=$(curl -s https://weather.com/weather/today/l/34.69,33.05?par=google | /usr/bin/grep -E -o "$EXPR" | tr -d -c 0-9 | head -c2)
CEL=$(lua -e "print(math.floor(($FAR - 32) * 5 / 9 + 0.5))")
echo "$CEL°C"

# !curl -sf "wttr.in?format=1" | tr -d "+" | awk 'NF{ print $NF }'
