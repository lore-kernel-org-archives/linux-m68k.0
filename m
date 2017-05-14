From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Linux 4.11 FTBFS on m68k
Date: Sun, 14 May 2017 08:19:26 +0200
Message-ID: <m2bmqwot8x.fsf@linux-m68k.org>
References: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
        <20170512084740.GE29311@physik.fu-berlin.de>
        <284dc1b1-1fef-90c3-f56f-7927f5bf22b0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:38075 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751124AbdENGTa (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 14 May 2017 02:19:30 -0400
In-Reply-To: <284dc1b1-1fef-90c3-f56f-7927f5bf22b0@gmail.com> (Michael
        Schmitz's message of "Sun, 14 May 2017 15:11:24 +1200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Mai 14 2017, Michael Schmitz <schmitzmic@gmail.com> wrote:

> this may be compiler version specific - I recall these functions were
> used from the kernel source with gcc 3.3.6 or thereabouts (I had to add
> __divdi3 five years ago for some driver that needed it and it wasn't
> then provided by gcc for some reason).

The kernel deliberately does not use libgcc, and it does not want a
64-bit devision on 32-bit archs.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
