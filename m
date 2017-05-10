From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Wed, 10 May 2017 21:21:39 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:20859 "EHLO
        herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753039AbdEJVoW (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 10 May 2017 17:44:22 -0400
In-Reply-To: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
Content-Language: de-DE-1901, en-GB
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

John Paul Adrian Glaubitz dixit:

>actually re-packed by me by replacing libjvm.so from Andreas Schwab's build

Ouch.

Does diffing the disassembly of (parts of) that give any meaningful
information? Maybe rather the individual .a files in libjvm.a?

As for the main problem, no idea. I don’t even know what a futex is.
Only that it has something to do with multiple CPUs. (And wasn’t m68k
Linux currently single-CPU only?)

bye,
//mirabilos
-- 
21:49⎜<allamoox:#sendmail> I have a question guys,
     ⎜    Can I use my PC as SMTP server, I use Windows 7 .
     ⎜    Already googled and Installed IIS
     ⎜    but Still I can't send E-mail
