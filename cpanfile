requires 'perl', '5.008002';

requires 'File::Which', '1.19';

on 'test' => sub {
    requires 'Module::Find', '0.13';
    requires 'Perl::Critic', '1.126';
    requires 'Test::Mock::Guard', '0.10';
    requires 'Test::More', '0.98';
    requires 'Test::Perl::Critic', '1.03';
};

on 'develop' => sub {
    requires 'Minilla', '3.0.1';
    requires 'Test::CPAN::Meta', '0.25';
    requires 'Test::MinimumVersion::Fast', '0.04';
    requires 'Test::PAUSE::Permissions', '0.05';
    requires 'Test::Spellunker', '0.4.0';
};
