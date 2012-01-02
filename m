From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 02 Jan 2012 03:40:00 +0000
Message-ID: <1325475600.13595.208.camel@deadeye>
References: <1325264773.13595.133.camel@deadeye> <9569.1325306817@jrobl>
	 <CAMuHMdXFrFqxjEBr5iG4s7naBRom6FzM6wPGi1f9HYVsv_c8dg@mail.gmail.com>
	 <Pine.BSM.4.64L.1112311628570.14351@herc.mirbsd.org>
	 <5968.1325473093@jrobl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yZo2Ji58pan2SzC381Rf"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:44765 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751441Ab2ABDkZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 22:40:25 -0500
In-Reply-To: <5968.1325473093@jrobl>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sfjro@users.sourceforge.net
Cc: Thorsten Glaser <tg@mirbsd.de>, aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


--=-yZo2Ji58pan2SzC381Rf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-02 at 11:58 +0900, sfjro@users.sourceforge.net wrote:
> Thorsten Glaser:
> > >It introduces a new separated file include/linux/aufs_name.h.
> >
> > Isn=3DE2=3D80=3D99t that a bit overkill?
>=20
> Hmm, I may have to agree with that.
> Honestly speaking, I don't like this approach.
> But embedding (expanding) AUFS_NAME is worse for me.

Why, how often do you expect to change AUFS_NAME?

[...]
> So I still think it is better to define it in Makefile.
> If I remove refering the "current" macro in the definition, then the
> life will be easier, but it is still useful and I want to keep
> it. Additonally it is not a essential problem I think.
> Finally I'd like to add sched.h between aufs_name and pr_fmt (see the
> attached patch).
> How do you think?

I think it would be much better to put this in fs/aufs/aufs.h and make
each of fs/aufs/*.c include that first.

> J. R. Okajima
>=20
> --- a/fs/aufs/Makefile
> +++ b/fs/aufs/Makefile
> @@ -10,6 +10,7 @@ endif
>  ccflags-y +=3D -DDEBUG
>  # sparse doesn't allow spaces
>  ccflags-y +=3D -imacros linux/aufs_name.h
> +ccflags-y +=3D -include linux/sched.h
>  ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__fu=
nc__,__LINE__,current->comm,current->pid'
> =20
>  obj-$(CONFIG_AUFS_FS) +=3D aufs.o

The comment about sparse belongs immediately before the definition of
pr_fmt.

Ben.

--=20
Ben Hutchings
All the simple programs have been written, and all the good names taken.

--=-yZo2Ji58pan2SzC381Rf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATwEnEee/yOyVhhEJAQpRbg//Xk3jmsqSxFFewpksWgb7GAUHgIszUlYV
pTPxpQxSuoL2gODVZ9VNUTZs4DTHEFXF755IYcxq9zFWGpYpa9OCVBHog1YuPb5Z
o2sjaCUhKgzaVQHCj+oNS6KSXOcBFP2EuFj76Cy9TzBKQN1WlzmIP0eUvb24QTsO
nc+b5UJvSJUquMulOdFvWuW1JAVKYu8khCqX42Wc6E1WjEgyIFIXaThpOo8H3vAu
MOB1WdO66QqYMXBVhLB2xVH55swXhnbnd0I62g7y33MUsU3Mpsx3GT292x+cA6to
De3sVLSQ+Ndf081WXuOsyDQtfYOjr0DNq8AQE2Nz2vvoHpK+Hra6HJ0AdpCHtvxh
OVz6jMe4ZjdP9tJUZyQbbgEt+yz7lVnnPqESZ5vQPt+fbmX1bl+wsRnZdQVuqCgv
BA2lLZecuLy9jwdVcBJFnZNhDhHiywp5zUkh7o0cmw354Rlz40v5aSk61KV7hkg8
ZWGQei3Mixv/jZqUKYmy9TjjTJ8bXZ0t2jbSMm04Zvz1YVS7Q1EKLRIf762uAani
L4o5Fn0OCPoCYh6Fg3zXHLcA8fs7+R0z+khsAsAEn2BhCPuDg9bjU6qd3Zg6SLSJ
mpP0doCG/+MDZjHIE18X89nxLAvUUS2frVp3BgD0KKa7aYRfGvjwn7Svin9WZwvM
oVLt4o6JtIw=
=TJqS
-----END PGP SIGNATURE-----

--=-yZo2Ji58pan2SzC381Rf--
