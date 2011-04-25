From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian kernel v2.6.38
Date: Mon, 25 Apr 2011 14:19:09 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1104251417540.13600@herc.mirbsd.org>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org>
 <BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com> <4DB34EE6.6010004@gmail.com>
 <BANLkTinPijbiOCN_uTokGwT79ua0YyhOEw@mail.gmail.com>
 <Pine.BSM.4.64L.1104241134030.8787@herc.mirbsd.org> <4DB4DE48.7040801@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:2215 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131Ab1DYO1d convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Apr 2011 10:27:33 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p3PEJDpW028263
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Mon, 25 Apr 2011 14:19:16 GMT
In-Reply-To: <4DB4DE48.7040801@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Michael Schmitz dixit:

> Patch trimmed down in what respect? No ST-RAM pool allocation at all

Yes, that=E2=80=99s why I had it included in the second preview, which =
is
what=E2=80=99s now accepted.

> Geert has given me something to think about with the allocate_resourc=
e
> suggestion. If that works at module load time (both ataflop and atari=
_scsi
> ought to work as modules) it definitely would be the preferred way.

OK. I=E2=80=99m not (really) a kernel programmer, so looking forward to
input from you. Currently I=E2=80=99m mostly putting pieces together.

bye,
//mirabilos
--=20
13:47=E2=8E=9C<tobiasu> if i were omnipotent, i would divide by zero
                all day long ;)
(thinking about http://lobacevski.tumblr.com/post/3260866481 by waga)
