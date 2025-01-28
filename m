Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8874B16BE17
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jan 2025 06:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738046022; cv=none; b=TjXXYDsh+UKFg6JjqnfG5q2Z9vtjwVIgPo+v6p63yXMCDKMsHhMIAOapszey5g+ToK4WVnAU+ADIMwwt6BLu8p9pigtqtU3uEWQ12WElU8VJjsnLVKhxy0Z1NX+StJdVxSGEUFcUPMaEc1IGfdmJPpiofV39RfWqUCI5DLnL5YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738046022; c=relaxed/simple;
	bh=FSpoJ2TC1jA9HVQaAc9Io1l4mcZ8rwk1uaEt91q4G6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQ4JbH+fGNSC8/0rYbpHBhPwxy8xnnLuPHMA0AEMXTXZSvz2CBUdxsv7G7hWaxGWgaxNJs5Nn7YovRcuPo1pFFw0kI9idg4TJuh2QSG7ySc0SaZYULMDJlYT2BOisqxAv4woFHp2bXtlNV0YNWM6V4YWMQUWOERbFcXMQ6enl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=F7h0/vQw; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="F7h0/vQw"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 292EE1BF204;
	Tue, 28 Jan 2025 06:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1738046018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGW+hbiN9+48FsBJ18c6UU4uWTDfmWMZligkQ+hghPI=;
	b=F7h0/vQwvdGXEBd7HJSG6EKa6Qn9uJKSPy+THmHyQwhyDOlh7ba9DtiaFa1oyIFqPekGTI
	96/ggwfGIUPyTbr3zYNZ0vT8T+qiGl9wgXd4HReZ9OLA1Wus9C3TV/RoYU2FyWjedJNKEg
	BefWH2NM3dFJjc8o96XMus1FFQWJKH/X65f9/x3xa9i+1kmBPThbOJJoL7olAe57JNufwL
	hCutq132oI19vPlWgcfZqclbSgX/gPc9wCdss59cT/pdjvFk6jbJ0QK23AdGDwEYZ7son7
	8H5RZwUTaouxD7ctzYmgW/2nKdVPQZ4jmRnPpolY5zgb/hiMsW814VWqItahwQ==
Message-ID: <ba7ea0f0-be38-49a7-b416-3dc62c7e7425@yoseli.org>
Date: Tue, 28 Jan 2025 07:33:37 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire
 M5441x
To: Christoph Hellwig <hch@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
 <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
 <Z5h0vvL0B5ktd3sM@infradead.org>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <Z5h0vvL0B5ktd3sM@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Christoph,

On 28/01/2025 07:10, Christoph Hellwig wrote:
> On Tue, Jan 21, 2025 at 11:54:14AM +0100, Jean-Michel Hautbois wrote:
>> Introduce `dma_ops` for the Coldfire M5441x platform, enabling both
>> coherent and streaming DMA operations. This addition should fill the gap
>> for DMA support integrates with the existing kernel DMA framework.
> 
> Arch dma code should not implement DMA OPS, but use the generic
> dma-direct code with the right helpes for handling coherency.  This
> variant looks like it should be using the DMA_COHERENT_POOL allocator
> for dma coherent memory.

Thanks for your answer.
I am not sure to understand it though :-) because I can see a few 
dma_map_ops implementations in arch code. I tried to let dma_direct do 
the work, I can't remember exactly what happened but it was not great :-).
I can give it a second try.

Thanks,
JM
