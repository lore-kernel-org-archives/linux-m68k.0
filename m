Received: from welho-filter2.welho.com (welho-filter2b.welho.com [83.102.41.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508C21862BD
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 23:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219521; cv=none; b=mZDJcqhL5XUMNrcQfY00UGwApEaSnWDxjdQloprAJB11g4WnbfeONd41N74loa4iNdrP31aBPMQSc1fnr13GB8CLBsndubOovhg45lqLqvCyeaAQepKOKxsdw7u0ecWuRHKCtrXXRvCbuutARq4BH2vm0qPm2gMXjiOEOWDyb1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219521; c=relaxed/simple;
	bh=4S2FgCVGZBSvug9/jMIHjA8+tk1HsICTcPiRKAUNZ2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MORjdmSSZH3C1PmCD80CjADJBcPl7V8sPMpbkOxbqSKn/dqx87OmXuflzptCNGCXTGYEHYb7sMHdEJkJ5J2kXSW0V79wXUuwMfFJFFJ+ahgCqw0j3rbyQ4LpnGum0TppZFDsq2DqXmGYdEAjieBC1YmXd8UwAmfvnh4iFoSPDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter2.welho.com (Postfix) with ESMTP id D2FA943D2D;
	Wed, 25 Sep 2024 02:11:48 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
	by localhost (welho-filter2.welho.com [::ffff:83.102.41.24]) (amavisd-new, port 10024)
	with ESMTP id DLmFt58FdZaT; Wed, 25 Sep 2024 02:11:47 +0300 (EEST)
Received: from [192.168.101.100] (87-92-120-123.bb.dnainternet.fi [87.92.120.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by welho-smtp1.welho.com (Postfix) with ESMTPSA id 64A0828B;
	Wed, 25 Sep 2024 02:11:45 +0300 (EEST)
Message-ID: <fff20dd3-d82b-4095-b367-1aaf118ef8a0@helsinkinet.fi>
Date: Wed, 25 Sep 2024 02:11:45 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20240922214821.16818-1-oak@helsinkinet.fi>
 <4540348c-84f6-4993-97b5-f007771be444@gmail.com>
 <eed880a2-8c02-40d7-813b-c6e8f1b8c197@helsinkinet.fi>
 <877cb03gju.fsf@igel.home>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <877cb03gju.fsf@igel.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25.9.2024 0.09, Andreas Schwab wrote:
> On Sep 24 2024, Eero Tamminen wrote:
>> On 24.9.2024 4.03, Michael Schmitz wrote:
>>> On 23/09/24 09:48, Eero Tamminen wrote:
>>>> Not having it configured, but crash backtraces going through its IRQ
>>>> handling code, is confusing (found while debugging issues in Atari
>>> I don't see how backtraces could go through the EtherNAT interrupt code
>>> - the interrupt only gets enabled if the hardware has been detected.
>>> Maybe you meant you see the generic IRQ handling code called for the
>>> EtherNAT's interrupt controller?
>>
>> It was many years ago, but I _did_ see one of these functions in Hatari
>> debugger's backtrace, although I had explicitly disabled EtherNAT support.
> 
> That can easily happen if a word on the stack happens to match the
> address range of an unrelated function.

Hatari debugger backtrace does not rely on frame pointers or stack 
content unwinding, i.e. it's immune to stack corruption.

Backtrace is a by-product of Hatari profiler, which tracks every 
emulated (CPU & DSP) instruction and constructs call-graph while the 
code runs, by comparing PC register values against function addresses.

---

LILO functionality in Hatari reads function addresses from the 
(specified) "Symbol.map" file (in addition to starting kernel). After 
typing "profile on" in debugger, one sees backtrace every time debugger 
is invoked.

(To trace all kernel function calls, one can use Hatari "--trace 
cpu_symbols" option, which can be toggled in the debugger, either 
manually, or automatically by a breakpoint.  To trace a subset of the 
function calls, one can remove others from the "Symbols.map" file.)


	- Eero

PS. To do similar instruction tracking for PCs would need special data 
collection HW and offline data processing (ARM ETM [1] & Intel PTI [2]), 
but when emulating old/slow m68k machines, it can all be done in SW at 
real-time.

[1] 
https://developer.arm.com/documentation/ddi0488/h/embedded-trace-macrocell/about-etm
[2] https://lldb.llvm.org/use/intel_pt.html
