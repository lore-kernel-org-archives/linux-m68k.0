From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux 4.11 FTBFS on m68k
Date: Sun, 14 May 2017 09:55:50 +0200
Message-ID: <1bdb9323-f281-6497-3307-c35653eda7d3@physik.fu-berlin.de>
References: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
 <20170512084740.GE29311@physik.fu-berlin.de>
 <284dc1b1-1fef-90c3-f56f-7927f5bf22b0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:43842 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751334AbdENHzw (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 14 May 2017 03:55:52 -0400
In-Reply-To: <284dc1b1-1fef-90c3-f56f-7927f5bf22b0@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Debian m68k <debian-68k@lists.debian.org>

On 05/14/2017 05:11 AM, Michael Schmitz wrote:
> What version of gcc does Debian use for building their kernel packages?
> What did you use?

Debian uses gcc-6 for building the kernel which can also be seen from
the build log in question [1].

Adrian

> [1] https://buildd.debian.org/status/fetch.php?pkg=linux&arch=m68k&ver=4.11-1%7Eexp2&stamp=1493971608&raw=0

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
