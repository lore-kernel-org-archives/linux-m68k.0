From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Sun, 21 May 2017 14:53:56 +0200
Message-ID: <20e7d4da-f120-83da-64d8-efd55b2b7c84@physik.fu-berlin.de>
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
 <m2vaoumzsf.fsf@linux-m68k.org>
 <de9dfb80-cc9f-403e-44c6-b9fa70e964ce@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:44004 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752105AbdEUMx7 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 21 May 2017 08:53:59 -0400
In-Reply-To: <de9dfb80-cc9f-403e-44c6-b9fa70e964ce@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/21/2017 01:15 PM, John Paul Adrian Glaubitz wrote:
> On 05/21/2017 09:31 AM, Andreas Schwab wrote:
>> Firebird 3.0.1.32609 built successfully on aranym for me.
> 
> Yes, and I am fully aware of that. It also used to built fine on Debian
> but it no longer does and we need to figure out why. There is a bug hidden
> somewhere that you apparently haven't run into yet.

It seems pypy is affected as well [1]:

********#%*********%#%%%%%[144e6] translation-task}

[translation:info] inserting stack checks...
[144f8] {translation-task
starting stackcheckinsertion_lltype
**
[rtyper] specializing: 190000 / 190002 blocks   (99%)
[rtyper] -=- specialized 7 more blocks -=-
E: Build killed with signal TERM after 284 minutes of inactivity

Built tested on Aranym. Or maybe the timeout was insufficent.

Adrian

> [1] https://people.debian.org/~glaubitz/pypy_5.6.0+dfsg-4_m68k.build

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
