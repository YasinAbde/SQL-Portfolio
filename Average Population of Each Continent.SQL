select country.continent, floor(avg(ci.population)) from country
join city ci on country.code = ci.countrycode
group by continent;