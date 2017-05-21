From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Sun, 21 May 2017 09:31:28 +0200
Message-ID: <m2vaoumzsf.fsf@linux-m68k.org>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
        <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org>
        <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de>
        <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
        <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de>
        <alpine.LNX.2.00.1705111610410.23897@nippy.intranet>
        <97dd75af-d1da-5cb6-ef73-e1f968be3d61@physik.fu-berlin.de>
        <20170511082001.GA10826@physik.fu-berlin.de>
        <alpine.LNX.2.00.1705201604460.2137@nippy.intranet>
        <29030655-b6d9-9301-5c0e-fcb78aad28f1@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:37563 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750993AbdEUHbc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 21 May 2017 03:31:32 -0400
In-Reply-To: <29030655-b6d9-9301-5c0e-fcb78aad28f1@physik.fu-berlin.de> (John
        Paul Adrian Glaubitz's message of "Sun, 21 May 2017 07:27:43 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mai 21 2017, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:

> 5. cd firebird3.0-3.0.2.32703.ds4/
>
> 6. ./debian/rules binary-arch
>
> It should hang at some point when running the compiled binary on Aranym
> or qemu-system. On qemu-user, it will just crash but for other reasons.

Firebird 3.0.1.32609 built successfully on aranym for me.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
