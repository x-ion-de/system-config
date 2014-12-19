# == Class: openstack_project::users
#
class openstack_project::users {
  @user::virtual::localuser { 'jrosenboom':
    realname => 'Jens Rosenboom',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCxBkH6rMEVEwWaysNK5tbsOycdl4X7S7sRlkZcKiuT16yUAQNv6K9iFnEYXIPqMDx3Yj/7J7aeLwzPaHixUMFrdpl8O3IbiII+DOc3YFkaIAyuHa+D7dp2otwgeA+730ELE2h0eBfcmejg9um2gZtkHo6M3GJP9Wn9v1Vt/xNNDeBWpGqLC2JClASiEtYCXvkgvv36XQN2dTnqKaVEbMkE1aHkD1dXxa5ugxeawgpETatvd5mRrv85HVgwfNe7sjIuxA1Y6wz1tT8vUMx0hmD8R5CVhwlTXNqbxrCl69CLxwOFHOkbwm6egbHiVgCTtRbM8dwlt+4gJ3FlJcCa9Ydb',
    key_id   => 'jrosenboom@somewhere',
    uid      => 2000,
    gid      => 2000,
  }

  @user::virtual::localuser { 'jklare':
    realname => 'Jan Klare',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC/tIv/7WG7D5qNDE5GE2GF1ZkAja1sSYRomcIa77yV8Dvx3xH7ReT8wpaLYypNt5NumQPWOCRGdItcmhvFHWzPm1AwN5oW5tb7+XYGdra//nUQ5ARXAQx7PkRjnLXyQsXGEgzPqVRIprtYGWO4vbRXCfNNn1HhoikgPJB/pbEbUN2wHSYGKi21vzF+aDTYVeETWOiR1sqHUc6HgTGV0fGyHAfy7UQxmr0j94UBCy6B/CLRTe5U/8M73XVPTfHOKD5jeBbcZODR0n8EZXGSHLdD8jRTa2/oFcgqn5wZSgHseAorTDs0aPYFSSUTflvTbilWip7i0wg8AdLAEw7JnIfx',
    key_id   => 'jklare@jklare-VirtualBox',
    uid      => 2001,
    gid      => 2001,
  }

}
