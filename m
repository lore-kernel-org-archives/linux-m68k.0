Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3181A4E9E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Oct 2024 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729686259; cv=none; b=M7Ixd5rXGgcAe19LRKg5GHJc6ptsOVvPkdHs9V19R+Kz+vI8t1XNBBvPsuVSroG0wEnCNCNBUkCvx1u38Bvj98TyuRtdAi5MV6GBktFQgIsmtKDaAZDWb6KONGEClElW/fYeN8SfpeCW9Y/68FAU/2DE/gOxjKpay+xISt78RJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729686259; c=relaxed/simple;
	bh=kVIkiqJerZn1bXsM+Q/tRQswUkYUbys/FicCMq36JfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jrvghiZtr0sg4zyM/smAN/OEiPNPngLqPriAxpygIaI3zi3uw67McvFoYxgyUuiFSFbsOHaf9QkIccRRtivWZ3ArgLe9g7afNC3phStE6e+YfL9FWy5+J3M/J7tN0Ds6BcWpQPNpYMY+nDP+k8EwNZnDZ/IOa4gZOf1+b/qVl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBC1DA4388F;
	Wed, 23 Oct 2024 12:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C4CC4CEC6;
	Wed, 23 Oct 2024 12:24:14 +0000 (UTC)
Message-ID: <7e2acfc4-2ce3-4417-9949-bb5331630ad3@linux-m68k.org>
Date: Wed, 23 Oct 2024 22:24:12 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DMA support on Coldfire
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org
References: <e907b202-99db-4f49-be4b-d729f7b41b86@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <e907b202-99db-4f49-be4b-d729f7b41b86@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi JM,

On 23/10/24 00:48, Jean-Michel Hautbois wrote:
> Hi there !
> 
> I can see there are a lot of eDMA interrupts requested at boot, on my M54418 board, but I can't see any of it used for UART while using the serial port. Is it supported in RX/TX ? Should something be done for it to be used ?

The ColdFire serial driver (drivers/tty/serial/mcf.c) does not support DMA operation.
Historically very few parts had DMA support for UART block.


> I am wondering, because I added a few traces (trace_printk with trace support [1]) and it seems I get one interrupt per 1 or 2 bytes only. I am using UART2 for a serial communication with another CPU, and it looks like it is using a *lot* of interrupts for the UART, and none on any eDMA interrupts ?

Even on the parts that support DMA the buffer (FIFOs) are small.
On TX it is mostly a holding and shift register only, so the best you
usually get is 2 bytes per TX interrupt. Some parts, like the m5441x
family have a 3 byte RX FIFO, so still small.

Regards
Greg

