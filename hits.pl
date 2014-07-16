#!/usr/bin/perl
$minute = 0;
$hour = 0;
$max = -1;
$maxhour = 00;
$maxminute = 00;
$file = @ARGV[0];
print "working on - ", $file;
do
{
	do
	{
		if ($hour < 10)
		{
			if ($minute < 10)
			{
				$result = `grep "26/Apr/2013:0${hour}:0${minute}" ${file} -c`;
			}
			else
			{
				$result = `grep "26/Apr/2013:0${hour}:${minute}" ${file} -c`;
			}
		}
		else
		{
			if ($minute < 10)
			{
				$result = `grep "26/Apr/2013:${hour}:0${minute}" ${file} -c`;
			}
			else
			{
				$result = `grep "26/Apr/2013:${hour}:${minute}" ${file} -c`;
			}
		}
		print $hour, ":", $minute, ",", $result;
		if ($result > $max)
		{
			$max = $result;
			$maxhour = $hour;
			$maxminute = $minute;
		}
		$minute = $minute + 1;
	} until($minute >= 60);
	$minute = 0;
	$hour = $hour + 1;
} until($hour >= 24);
print "max was ", $max, " at ", $maxhour, $maxminute;
