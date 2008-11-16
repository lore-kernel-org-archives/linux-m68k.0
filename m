From: Petr =?ISO-8859-1?Q?Stehl=EDk?= <pstehlik@sophics.cz>
Subject: Re: [PATCH/RFC] atafb and panning
Date: Mon, 17 Nov 2008 00:22:57 +0100
Message-ID: <1226877777.6526.11.camel@joy>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.vol.cz ([195.250.128.75]:52143 "EHLO smtp2.vol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751303AbYKPXnf (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 16 Nov 2008 18:43:35 -0500
In-Reply-To: <Pine.LNX.4.64.0811162235251.20005@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven p=ED=B9e v Ne 16. 11. 2008 v 22:36 +0100:
> Fix panning on ARAnyM (Falcon emulation). Without this, `fbtest test0=
11' fails
> (for a 320x200x8 display with virtual 640x400).
>=20
> As the original code in 2.4.x was the same, I'm wondering:
>   o Is this a bug in the ARAnyM emulation?
>   o xpanstep is 1, but judging from the visual output on ARAnyM, it l=
ooks like
>     it should be 16?

A bug in ARAnyM emulation is _always_ possible but I do have an idle
=46alcon sitting next to my desk so if you send me a disk image to try =
out
I should be able to find out what's wrong pretty quick.

Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
