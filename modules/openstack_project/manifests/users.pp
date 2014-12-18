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

}
