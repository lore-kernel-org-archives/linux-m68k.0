From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Sat, 28 Jan 2012 21:01:24 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201282100540.31292@herc.mirbsd.org>
References: <4F1C577D.3040908@sigon.net> <CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
 <CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
 <loom.20120127T184202-114@post.gmane.org> <4F245963.9070605@gmail.com>
 <Pine.BSM.4.64L.1201282041180.31292@herc.mirbsd.org>
 <CAMuHMdUiykMQ5RLat=fOakQ155oboCOcwKYyDeaAE2baBN7gKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:31399 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752766Ab2A1VLI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jan 2012 16:11:08 -0500
In-Reply-To: <CAMuHMdUiykMQ5RLat=fOakQ155oboCOcwKYyDeaAE2baBN7gKA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>> (What=E2=80=99s SYS_333, and why does strace not know it?)
>
>#define __NR_get_thread_area    333
>
>Thread Local Storage.

Ah.

>-ESTRACE_TOO_OLD?
>-ESTRACE_NEVER_UPDATED?

Probably the latter=E2=80=A6 it=E2=80=99s been rebuilt after TLS was
introduced, and was updated in Debian too.

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
