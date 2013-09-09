From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/2] m68k: Add infrastructure for machine-specific
 get_cycles()
Date: Mon, 9 Sep 2013 20:35:23 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1309092033110.15325@herc.mirbsd.org>
References: <1378754774-25804-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:2255 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755549Ab3IIUq2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Sep 2013 16:46:28 -0400
In-Reply-To: <1378754774-25804-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org

Geert Uytterhoeven dixit:

>Currently get_cycles() always returns zero.  As get_cycles() is called=
 to
>add entropy to the random number generator pool, security can be incre=
ased

You rock for having something before MIPS ;-) (Note that other
architectures like CRIS are also affected=E2=80=A6 just, MIPS probably
has the broadest impact=E2=80=A6 even I have a FreeWRT WLAN AP.)

Sorry I can=E2=80=99t provide any feedback because I=E2=80=99m out of m=
y depth on
both the hardware and the requirements aspect.

bye,
//mirabilos
--=20
Sometimes they [people] care too much: pretty printers [and syntax high=
ligh-
ting, d.A.] mechanically produce pretty output that accentuates irrelev=
ant
detail in the program, which is as sensible as putting all the preposit=
ions
in English text in bold font.	-- Rob Pike in "Notes on Programming in C=
"
