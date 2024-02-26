#!/usr/bin/perl

my $dockeruser="garo";
my $image="easy-xpra";
my $branches_to_tags = {
	"alpine" => "latest",
	"ubuntu" => "ubuntu",
	"ubuntu-small" => "ubuntu-small",
};

my $current_branch = `git rev-parse --abbrev-ref HEAD`;

foreach my $branch (keys %$branches_to_tags) {
	my $image_and_tag = "$dockeruser/$image:$branches_to_tags->{$branch}";
	if(system("git checkout $branch &&  docker build -t $image_and_tag .") == 0) {
		print "Building $image_and_tag is successful\n";
	} else {
		print "Building $image_and_tag failed\n";
	}
}
system("git checkout $current_branch");
