From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 12:42:16 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1307241241550.30771@herc.mirbsd.org>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org> <87li4wpc79.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:31893 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003Ab3GXNET convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jul 2013 09:04:19 -0400
Received: from herc.mirbsd.org (tg@herc.mirbsd.org [192.168.0.82])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id r6OCgHet000289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Wed, 24 Jul 2013 12:42:22 GMT
In-Reply-To: <87li4wpc79.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>The problem is that aranym expects the parameters of the natfeat calls
>to be physical addresses.  The nf_get_id calls use literal strings as
>parameters which only works when the drivers are builtin because phys =
=3D=3D
>virt then.

Ah, right, there was that issue=E2=80=A6 so this patch should probably =
go in?

bye,
//mirabilos
--=20
17:08=E2=8E=9C=C2=ABVutral=C2=BB fr=C3=BCher gabs keine packenden smart=
phones und so
17:08=E2=8E=9C=C2=ABVutral=C2=BB heute gibts frauen die sind facebooks=C3=
=BCchtig
17:10=E2=8E=9C=C2=ABVutral=C2=BB aber auch traurig; fr=C3=BCher warst d=
u als nerd voll am arsch
17:10=E2=8E=9C=C2=ABVutral=C2=BB heute bist du als nerd der einzige der=
 wirklich damit klarkommt
