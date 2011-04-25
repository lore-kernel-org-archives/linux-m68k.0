From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian/m68k kernel (preview)
Date: Mon, 25 Apr 2011 15:08:33 +1200
Message-ID: <4DB4E5B1.7040206@gmail.com>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>  <BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>  <BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>  <BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com>  <BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com>  <Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org>  <20110423185725.GA16947@chumley.earth.sol>  <Pine.BSM.4.64L.1104232054070.3979@herc.mirbsd.org> <1303617602.3032.86.camel@localhost> <Pine.BSM.4.64L.1104242000490.8787@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:63560 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758044Ab1DYDIl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 23:08:41 -0400
Received: by pvg12 with SMTP id 12so1028028pvg.19
        for <linux-m68k@vger.kernel.org>; Sun, 24 Apr 2011 20:08:40 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1104242000490.8787@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, Debian Kernel Team <debian-kernel@lists.debian.org>

Thorsten Glaser wrote:
> (Michael, Geert, please read below for action item.)
>
>  =20
> Michael Schmitz: I=E2=80=99ve changed one line in your ST-RAM patch
> to avoid a trigraph (changed "??)" to "?)"). Geert, can you
> please update the patch in your git? I=E2=80=99ve also added signoff
>  =20
Looks liked Geert had that fixed already - cannot find "??" in my tree=20
in stram.c (not anywhere I touched, leastways).

Cheers,

  Michael
