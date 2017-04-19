From: Wouter Verhelst <wouter@debian.org>
Subject: Re: gcc possibly generating invalid assembler
Date: Wed, 19 Apr 2017 10:38:28 +0200
Message-ID: <20170419083828.cs5voxoczxibwb5f@grep.be>
References: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
 <20170414073651.bwpg7plhfz23v24b@grep.be>
 <cf267478-6b32-a822-c01d-2b6bfbe2f98f@physik.fu-berlin.de>
 <20170419073938.235okxaw2e4rw3ev@grep.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from latin.grep.be ([46.4.76.168]:51549 "EHLO latin.grep.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933431AbdDSIio (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 19 Apr 2017 04:38:44 -0400
Content-Disposition: inline
In-Reply-To: <20170419073938.235okxaw2e4rw3ev@grep.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Apr 19, 2017 at 09:39:38AM +0200, Wouter Verhelst wrote:
> due to lack of pthread support, or the optimization level. Feels like
> someone failed to read the automake documentation properly (CFLAGS is
> supposed to remain unset; and indeed checking out configure.ac reveals
> some CFLAGS munging that shouldn't happen).

Filed https://bugs.lttng.org/issues/1095 about that issue. Haven't filed
a bug report about the optimizer bug yet.

-- 
< ron> I mean, the main *practical* problem with C++, is there's like a dozen
       people in the world who think they really understand all of its rules,
       and pretty much all of them are just lying to themselves too.
 -- #debian-devel, OFTC, 2016-02-12
