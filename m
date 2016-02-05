From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: Linux/m68k on the Apollo FPGA softcore?
Date: Fri, 5 Feb 2016 15:49:53 +0100 (CET)
Message-ID: <alpine.OSX.2.20.1602051545100.775@brendeholten.uninett.no>
References: <alpine.DEB.2.10.1602021757210.2761@firda> <56B36771.9010006@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from epost.ufisa.uninett.no ([158.38.152.65]:43501 "EHLO
	epost.ufisa.uninett.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958AbcBEOtz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Feb 2016 09:49:55 -0500
In-Reply-To: <56B36771.9010006@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-m68k@vger.kernel.org

On Thu, 4 Feb 2016, John Paul Adrian Glaubitz wrote:

> On 02/02/2016 06:16 PM, Kolbj=C3=B8rn Barmen wrote:
> > From what I understand, the core implements a new FPU, not
> > compatible with existing FPUs, and there has
> > been talks about a new MMU implementation too.=20
>=20
> Well, that would be too bad given the fact that there is already a hu=
ge
> number of applications and kernels which work with the old FPU/MMU
> combination.

Sure, but the idea is to move forward from what I understand.

> I'd buy such an accelerator in a heartbeat, but it should be binary
> compatible with existing 68020+ code.

Apparently it will be usermode compatible with all existing 68k, but no=
t
supervisor mode compatible, not MMU compatibale, not FPU compatible. An=
d
it is already blazingly fast compared to most 68060 systems, without an=
y
optimization done.

I guess it will be an AmigaOS only CPU core :)

-- kolla
