Received: from welho-filter3.welho.com (welho-filter3b.welho.com [83.102.41.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EDB6E614
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727211528; cv=none; b=BtE0ZW003ui/J5R6HGypWVirHCdyIkpoMCk8xP3C4ZiLVeggekYHrg4dS4UnobQ9uZwHKc/xi7g9p/mHNse1Pa6w9nAnMPD3PTLBksxeJNygBVMWyIZP02CMTg8bcx0fc0TnVpabxtKsJK7rfvQIHeRIyepmGfbtg2FHtw4WaWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727211528; c=relaxed/simple;
	bh=gIa4Vvtn8V81MrwE7/e8oi+hlGCgveY2iKpuaBOECXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=L+PZ7m5IoFOeyh+bBqJOPLaQ4JP+GwelBbQwu3IQU6ATCNTBsoowQG5mHsrRPiVbhICwYdHnUTwB1ebZDh4HvAe9aggz0yiIVs6YDDDFVSWtsKZqRz2dqG9UCXGv/+ks2T87yE+AQ72FPkfKdZRs6+58FXD39rwhCjweJVGTEaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter3.welho.com (Postfix) with ESMTP id 44B011487F;
	Tue, 24 Sep 2024 23:58:36 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
	by localhost (welho-filter3.welho.com [::ffff:83.102.41.25]) (amavisd-new, port 10024)
	with ESMTP id nl99pXjZTXQa; Tue, 24 Sep 2024 23:58:36 +0300 (EEST)
Received: from [192.168.101.100] (87-92-120-123.bb.dnainternet.fi [87.92.120.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by welho-smtp3.welho.com (Postfix) with ESMTPSA id 026F12309;
	Tue, 24 Sep 2024 23:58:33 +0300 (EEST)
Message-ID: <eed880a2-8c02-40d7-813b-c6e8f1b8c197@helsinkinet.fi>
Date: Tue, 24 Sep 2024 23:58:33 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
To: Michael Schmitz <schmitzmic@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20240922214821.16818-1-oak@helsinkinet.fi>
 <4540348c-84f6-4993-97b5-f007771be444@gmail.com>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <4540348c-84f6-4993-97b5-f007771be444@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24.9.2024 4.03, Michael Schmitz wrote:
> On 23/09/24 09:48, Eero Tamminen wrote:
>> Not having it configured, but crash backtraces going through its IRQ
>> handling code, is confusing (found while debugging issues in Atari
> 
> I don't see how backtraces could go through the EtherNAT interrupt code 
> - the interrupt only gets enabled if the hardware has been detected.
> 
> Maybe you meant you see the generic IRQ handling code called for the 
> EtherNAT's interrupt controller?

It was many years ago, but I _did_ see one of these functions in Hatari 
debugger's backtrace, although I had explicitly disabled EtherNAT support.

I don't any more remember what I was debugging, but I think it's 
something already fixed / supported in Hatari.

=> Better just to drop that comment?


>> +#ifdef CONFIG_ATARI_ETHERNAT
> 
> I believe we now use
> 
> #if IS_ENABLED(CONFIG_ATARI_ETHERNAT)

OK.


> but that's perhaps a matter of taste (CONFIG_ATARI_ETHERNAT can't take 
> the value 'm').
 >
> OK by me if it helps with your debugging ...

The issue triggering it is unlikely to appear again, so it's not that 
important.  But I think those if(def)s are still the correct thing to do.


	- Eero

PS. As m68k Linux support is rather old, most of code appears to be 
still using ifdefs:

$ git grep "ifdef *CONFIG_" arch/m68k/ | wc -l
336

$ git grep IS_ENABLED arch/m68k/ | wc -l
62

$ git grep -c "ifdef CONFIG_" arch/m68k/atari/
arch/m68k/atari/ataints.c:2
arch/m68k/atari/config.c:7
arch/m68k/atari/nvram.c:1

$ git grep -c IS_ENABLED arch/m68k/atari/
arch/m68k/atari/config.c:3
