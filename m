From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: Re: [PATCH v3] arch: Kconfig: Let all architectures set endian explicitly
Date: Sun, 24 Aug 2014 16:38:39 +0800
Message-ID: <53F9A48F.3020803@gmail.com>
References: <53ECE9DD.80004@gmail.com> <20140814180418.GA20777@linux-mips.org> <53ED34CE.3040001@gmail.com> <53EDCC60.5040608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:48808 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751946AbaHXIeW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Aug 2014 04:34:22 -0400
In-Reply-To: <53EDCC60.5040608@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>, akpm@linux-foundation.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, Geert Uytterhoeven <geert@linux-m68k.org>, Jean Delvare <jdelvare@suse.de>, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, hskinnemoen@gmail.com, egtvedt@samfundet.no, realmz6@gmail.com, msalter@redhat.com, a-jacquiot@ti.com, starvik@axis.com, jesper.nilsson@axis.com, dhowells@redhat.com, rkuo@codeaurora.org, tony.luck@intel.com, fenghua.yu@intel.com, takata@linux-m32r.org, james.hogan@imgtec.com, Michal Simek <monstr@monstr.eu>, yasutake.koichi@jp.panasonic.com, jonas@southpole.se, jejb@parisc-linux.org, deller@gmx.de, Benjamin Herrenschmidt <benh@kernel.crashing.org>, paulus@samba.org, mpe@ellerman.id.au, Martin Schwidefsky <schwidefsky@de.ibm.com>, heiko.carstens@de.ibm.com, Liqin Chen <liqin.linux@gmail>

Hello Maintainers:

Is this patch OK? If it pass basic checking, please let me know, and I
shall try to make another related patch for KBuild (I can do nothing
related with Kbuild, before get confirmation for this patch).

Thanks.

On 8/15/14 17:01, Chen Gang wrote:
> 
> 
> On 8/15/14 6:14, Chen Gang wrote:
>> On 08/15/2014 02:04 AM, Ralf Baechle wrote:
>>>
>>
>> OK, thanks, I assumes when support both endian, the default choice is
>> CPU_BIG_ENDIAN, although no default value for choice (originally, I did
>> worry about it).
>>
>>> So I think you can just drop the MIPS segment from your patch.
>>>
>>
>> If what I assumes is correct, what you said sounds reasonable to me.
>>
>>
> 
> So for me, it is harmless to add CPU_*_ENDIAN explicitly, and can let
> other members don't need think of.
> 
> By the way, for sh, it is almost the same case, except it contents the
> default value, for me, it is clear enough, so I skip sh architecture in
> this patch.
> 
> 
> Thanks
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
