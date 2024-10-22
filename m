Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D77DA7C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Oct 2024 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729608525; cv=none; b=T5uWeh8fXrupXzdT2dIwM1eDh+jd70LQnjAwhTD/42sbIPoRYlZ8jn2F5gz2eho4R8IrTmimg8Gaed2WH99HfdPnx28BSgbcjuQJVtMT8RQFOmrlzj0BFY+XkM9Qd11Ee96zi8W5Gfb69Z+xeUDraTXOYJXLDfSfPpe3Vb4N6j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729608525; c=relaxed/simple;
	bh=NHLBcQgd9j1E/eRxfourBPOs8TVCCOoCRMcMDayhfCE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=e6PchKpevcxTOccMzLwM2IbcZkuQqlSB6RM4rUIUbZ4DiIokXnpmiywXiaNzNxYLQxiJ6RxsX2VhSF++G+EjrBEc1KQfC4pnZWYeJq0YM890RYzLcB0/ozmSwp+eKTpEwun7FFkguLLfMUo7pfQyh8c89Je3RuMDIwdKCnJVks4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=dalfAX3v; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="dalfAX3v"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C561520007
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Oct 2024 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1729608521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JuGYYberquq1zPsRiJgoa30T2oYNStdM4zfdTeFOJJo=;
	b=dalfAX3vpW75vjX6qVfsznzxdmJLmcWqPa5tgmY86V6woU4/93/wXZyo5bduZbUR8sHPLw
	a3LBDeopZ8D5p8lVQizSrQEEJJz4Fal8pBGQNiwZtVQFNX/G87bAt+KLhIKsFtVUl/zlnG
	Z/DTJOzQMZmReSJLO8/WX6wQ+P8QrTPQCEk0Nb51VN4SnwHFKdJhbEakKzb57NT8yRUMLr
	0wgA4rsOBGl5pozmICeH6wmGqH+66URz2jJvQoafIc4Dms+jRg9oFuVzc12dDZmVMAkuTa
	iHt9vdNcgKvucSKNY8EsPloaeTnigTG30Ywpz0c7CZpUqdhMyKiMa1+vcahPww==
Message-ID: <e907b202-99db-4f49-be4b-d729f7b41b86@yoseli.org>
Date: Tue, 22 Oct 2024 16:48:40 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: linux-m68k@lists.linux-m68k.org
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: DMA support on Coldfire
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi there !

I can see there are a lot of eDMA interrupts requested at boot, on my 
M54418 board, but I can't see any of it used for UART while using the 
serial port. Is it supported in RX/TX ? Should something be done for it 
to be used ?

I am wondering, because I added a few traces (trace_printk with trace 
support [1]) and it seems I get one interrupt per 1 or 2 bytes only. I 
am using UART2 for a serial communication with another CPU, and it looks 
like it is using a *lot* of interrupts for the UART, and none on any 
eDMA interrupts ?

Thanks in advance for your kind help !
JM
