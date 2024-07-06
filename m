Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05661C8F3
	for <linux-m68k@lists.linux-m68k.org>; Sat,  6 Jul 2024 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720246874; cv=none; b=X9gyW5Wuccko6dDVmPGJ6ZpiDFAqO3uwZNM5Qr20MMaal1cWaIbFF1VNZv2KgQVx8oBzq8NN3wbNaR4sINUdSJ/EJ5rULvA6R+TQ3aOJXjxvM3cRyIk46fBAVL5WV+THy7i8itRNwopC8Hm7TS5WV2cpYxeyMjYA7gNs996eK1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720246874; c=relaxed/simple;
	bh=GwthaGn+Mi6CPnQZbB4Nyzvt3Wzk+ihj5bUjV0opD70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pySeyMv3Bx0wBvc1lnLLkN5oTCpN1Hzinz5t8ddiCKfSCd2YeEABgRta60ARC79WKAVc79ybEuI5C5nJsKlZ1B6zJZGQxMDk+jLbnbSA88IjiuKrButM2+1iWAUUpfhEftuUkMUKgIMAeZxfDg7UpWhgxXCOY080FVeQTZPciwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=uFzzZK8e; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="uFzzZK8e"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c9a3c49efdso327216a91.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Jul 2024 23:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720246871; x=1720851671; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHwDCrp33hs7plKKkNk/uA0Am8r7jSjt1Yh6eeOVud0=;
        b=uFzzZK8eV/BzdPaOXcHDFwg/CdGlONoGexDNrBb/p9VamDKWc7yga/8i8Vw6GG/jTt
         m65haBitPQoW9zUtD/0H07igA+APUgLdllOe5RymlG+ezOU1JvCFGfy905DLNn+QQfL7
         usHg802Q6MII2/hUcBXNvOggYP8BWbXKPF23wQbnpofCZOsxqBoqgZ1UjI5mnReQbkeJ
         tEBLNyul+uKhqW9W+u7D405AkAVe9Ig7PVvgQ15uTgyIQH3KLg40Hao4YQtTUzERbn7j
         zaAbNDtWNaN5l2wbgH8CHzV2G40tlqYlCA0rSu9VJCp59GXuyyo66BNnHt+PpKsv+Z9D
         O/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720246871; x=1720851671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHwDCrp33hs7plKKkNk/uA0Am8r7jSjt1Yh6eeOVud0=;
        b=byf2D7PnmtsyIqL95hiUr6Mc9ZCLCD/pwO2EAyMHEK8X7zo/09tDENNM6S7IPCEkuQ
         gbrdz8NfDIMZyfKwKliZVFERf08sP0poRcKjnFJSn0LHKY4yjCp5QDHVXOZ1QncxttAd
         Avs+WXJdv7e3WYl5vNQBoy7UPjBCaRFQupSwuUzN+/xEZWl1R58eRsCj3Rkkc4j/IAyh
         vm2H8gNviN/Ruh3yweRQH6JBenVUTWWvFEwD4fQsl31W4/PFOiDkrRf4ps/99hsPrJXK
         62TGE6z8r8HorMADPcGMkAowbXSTEDeztY2iQRzCEu+C7ghp66oLp09ZwSbZJFAZgaY+
         Pxbg==
X-Forwarded-Encrypted: i=1; AJvYcCVvbgv42p5MaY6jfi3bcdSbImulLqsZlR7HlZeYL+NiayblJrZxm/20FGtKX7qvl1tkQrA+9Kwu2RnR+RBC6d2ehZEZEm1Fv62UtG2NHYsd
X-Gm-Message-State: AOJu0YxyD6PqR6gKSBM9rKQxZRzD5rE9h/QMLbr1zT99TJwA+x2mY5LE
	P+oSIDkc4ivfTe3HFHhKBVekhXe6WcGm6K0uSg5osWbWvYC3sboa7SMAyYSiRS8=
X-Google-Smtp-Source: AGHT+IFqpImcZYeF+q9yx4HjhMv0+L1uMX58YJi3GclqAj9rNXdFJkRgdkTBPfHMCRfWZpYSOCuGeg==
X-Received: by 2002:a05:6a21:9985:b0:1be:4c5a:eef4 with SMTP id adf61e73a8af0-1c0cc8f8c54mr7695077637.3.1720246871053;
        Fri, 05 Jul 2024 23:21:11 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21c8::1011? ([2620:10d:c090:400::5:7b2d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6c9e0ee3sm11952769a12.60.2024.07.05.23.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 23:21:10 -0700 (PDT)
Message-ID: <c2333a14-04bc-49be-8cc6-a03dcdb2eec3@kernel.dk>
Date: Sat, 6 Jul 2024 00:21:06 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] block: pass a phys_addr_t to get_max_segment_size
To: Christoph Hellwig <hch@lst.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, linux-block@vger.kernel.org
References: <20240705123232.2165187-1-hch@lst.de>
 <20240705123232.2165187-3-hch@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240705123232.2165187-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/5/24 6:32 AM, Christoph Hellwig wrote:
> Work on a single address to simplify the logic, and prepare the callers
> from using better helpers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-merge.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index cff20bcc0252a7..b1e1b7a6933511 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -207,25 +207,24 @@ static inline unsigned get_max_io_size(struct bio *bio,
>  }
>  
>  /**
> - * get_max_segment_size() - maximum number of bytes to add as a single segment
> + * get_max_segment_size() - maximum number of bytes to add to a single segment

v1 had this change too, not sure why? The previous description seems
better than the changed one.

-- 
Jens Axboe

