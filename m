Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573082;
	b=DDr6RejHZtaopUIjOOFwZlSchfd68v9T7kH29WucS9qNYpdQDY68qCUnFb4I4YQ2MwI9
	 5lTTI6LmHhY77stR3vMe8zfMgYU4orMTskGE3+VYd/7PzOfTYeuM67/ohwQBqj7WkK00F
	 eYNQxZj0HJuZXTp9QEc9vawTCjZx5XnYy3eMOeih1LmUgc6G27tj88x5AToww7zNzBeKw
	 Y9v2gS7ABSueA9VQ9VS1XK1S1sG+tK5Y8PGUazNXLK5IVw+NOl4k0dBxlYZtqZI6t5Hhl
	 gaWcK282K5zr9ziSEkU08Kksa9jvdxtc6DP6cz2uDbPdWMJwZGkJaJLhdOif7T1Xjgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573082;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PZFsgaUptmthCT9AGjarLBj+dSK/kXdt7D60tO+Fc1E=;
	b=EdvdsNDv9+s98W39tnmEI8Jd7iAxolMJxfYANmYurzNXdgI0U7oeVPVuNQ60LJU8coSu
	 ULScJ+kxx+vZi1x4ZtYawHRM5+4HRWXMiXwdfXPbWLE5Yz73oVwgsINjKh8yB1S3aQfZq
	 CfKQNQTx0+3VcBdrI9gm7JP6v20Eih7Knr8FUYhiCd17MJjd7rxm8sUKzCPXsSSWEWyvH
	 IROI+9cjVJuAgRYVKhW972xyWjavGGSCTFRDTuqxurNn9vElKVnlxHcaUWxoxtzsD/shm
	 ITio0kdBGYiiqN6BJR6nmXkM+HXMH2M2zOpz9D77SsMQMoshothyiXjeymDS7ejZdhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aYmuGmm/";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B57C606A320
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 08:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B57C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYmuGmm/
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DB9240D58;
	Wed, 21 Oct 2026 08:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939011F000CB;
	Wed, 21 Oct 2026 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792573080;
	bh=PZFsgaUptmthCT9AGjarLBj+dSK/kXdt7D60tO+Fc1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYmuGmm/+X3TuMt6En/yuxlAevDmd0Bbvy4zAnvkecXFDCBCHH4BFV2HeLMyOncG6
	 iKGNu8yvxaVvHYNxWEAcOVN5XFBxUULSVRqwdk8C1wabWjN9blXkG2dsAwo0wOz2hT
	 mif8kBJMD1JtRyluN3jtJHEYpowNAAb1jQwIZ/Thfthe/YwWNZrd+u5P5X/YRZJrTI
	 aD3T+PeiWZ6esjBFkbxkPU/x7zC6FMhPE9NGjjuHBE0rmfM1jCQ0Ypf5czE90KkfD7
	 bfQzKNg7L4JGb9MoBPFM0DJ3BgiIuLatLnXE+esDNPjTCoLkzQ8plSnmclDPAZaIgf
	 TJQiZ5tyQBJzQ==
Date: Wed, 21 Oct 2026 10:57:53 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Allison Henderson <achender@kernel.org>, 
	kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, wireguard@lists.zx2c4.com, 
	rds-devel@oss.oracle.com
Subject: Re: [linus:master] [sysctl]  8d75c338f0:
 BUG:KASAN:slab-use-after-free_in_touch_wq_lockdep_map
Message-ID: <ath-VoGkY_1JBES9@hobbes>
References: <202610190310.9737b2e3-lkp@intel.com>
 <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes>
 <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
 <atdE-TB8hkqcwp6g@hobbes>
 <atdK3ZkT4YqjGICq@redhat.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bt355i3q7cyhktpe"
Content-Disposition: inline
In-Reply-To: <atdK3ZkT4YqjGICq@redhat.com>


--bt355i3q7cyhktpe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linus:master] [sysctl]  8d75c338f0:
 BUG:KASAN:slab-use-after-free_in_touch_wq_lockdep_map
MIME-Version: 1.0

On Tue, Oct 20, 2026 at 01:05:01PM +0200, Oleg Nesterov wrote:
> On 10/20, Joel Granados wrote:
> >
> > On Mon, Oct 19, 2026 at 12:52:58PM -0700, Allison Henderson wrote:
> > >
> > > CONFIG_SYSCTL=3Dn.  A simpler fix might be to just handle the NULL at=
 the
> > > three call sites, e.g.:
> > >
> > >         rds_sysctl_reg_table =3D
> > >                 register_net_sysctl(&init_net, "net/rds", rds_sysctl_=
rds_table);
> > >         if (!rds_sysctl_reg_table && IS_ENABLED(CONFIG_SYSCTL))
> > >                 return -ENOMEM;
> > >
> >
> > Remember to NULL check rds_sysctl_reg_table in rds_sysctl_exit(). You
> > might hit another UAF on exit if you don't.
>=20
> Why? unregister_sysctl_table(header) does nothing if header =3D=3D NULL.
Nice catch! You can forgo the check as it is the first thing that
happens in unregister_sysctl_table.

Best

--bt355i3q7cyhktpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmrYfooACgkQupfNUreW
QU/WnAv/YVbhwQnlgm1v0MJMVqJO5TZOJ+RcOu/m4rFbvIPU8twKRupXLpWiQn/b
ICa4TdGkh96N3eS3UkV+Iiv9cSUVYgRBt1AXsJZ+JHRaufbZJIVIPhejQnxhjJe9
IQp55/hIG3MqlAbVIJBOgMKo5F7PbnElO2mRDkCXoc9KJ1wxvrjVCZodr+J6RWtt
e5OdPT9V1YmTuf37xRxpDWt4VRAtIrKIGMg3IqxHPPhFQlvepKVGLzgJYLNy/Ovt
vQkSONcvJhN1xkgKv+L+9cvlixaZaechi9psoCxWnDH0fxQBxamwcWmIKewNeoza
0W1An6oKC7did7l+hnLFAHKkt/8ePeddQM6ImdSmgAXueiCJ/Nr6hnI21D8eKQoA
U0n/7WU6S4/E7warmYG64iiAzKsI76Jd5nFYQY1feOLgQdMaa9RbcBFVqEAAoCQz
HvCPKex1+h1Ah/HxuC2wrvmUI3dX9AxrSo7NpuhKtPTzgXaLEfaAfW8tINh4pRXR
ZrHBWkU5
=s4u6
-----END PGP SIGNATURE-----

--bt355i3q7cyhktpe--
