From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: nfhd performance
Date: Sun, 18 Aug 2013 07:08:20 +0200
Message-ID: <1376802500.26218.3.camel@pracovni>
References: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx.zln.cz ([188.246.101.4]:55653 "EHLO mx.zln.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751098Ab3HRFI0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Aug 2013 01:08:26 -0400
In-Reply-To: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

Geert Uytterhoeven p=ED=B9e v P=E1 16. 08. 2013 v 23:57 +0200:
> 141114880 bytes (141 MB) copied, 17.09 seconds, 8.3 MB/s
> So nfhd is slower than emulated IDE?

nfhd is something like IDE with DMA (if everything is in buffer cache
then it's doing basically just a memcpy() from cache to the destination
place) - can't believe it would be that slow.

Don't have profiling numbers at hand but one of the main purposes of
nfhd was to be way way faster than the emulated IDE. Something must be
seriously wrong somewhere.

Petr
