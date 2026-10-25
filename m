Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792896790;
	b=s3Zp7vUiHv0Ps6O2+PDYZVBmxEaG1LLiyMCoYEIgOyMKJnplsyehd3U2bOcPTi/l47hL
	 GKoSfn35ZGx8QS2M1bEROw5OilacNRidEJHx97Phwsb43jwjkZICHVOYP2AH3iNYuDXr1
	 ZqmoD629bWEUFWGofIv8l6zLKPFR16WCN7GZBbvKltOXSGk9Gte6lfe0zDSexnpUJAMHF
	 9CpAdW3oEtSk0jtYTUis1Sb+aFdEMDwXiUEecwBydW6mISCb1TyX9P1FHBB83MVwwjfzL
	 KCcVuQPLyYSxmoNDkVen80/qNOkXWaLwvVl01JaKbWF3XSR4xZRE9yz2QXgsnXUZndg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jHGtF+NZaI+hhPHPeZP23JdzKtyfeu2RME20H6dVyog=;
	b=L5a00Zq1kd1uiaN1SBJFIrucQPa4W1w2Up1vHpsdnTiYLDtjfwQTFHJf27Xf226l8l3y
	 YnMaCCfnC3jFxiH87rmMJlltPnMBLNv63rX7cWVo8vqlgCjLRnpNzA748giXktQu799b5
	 HAg3rLNIXPmw2HcJYRC+mbElGOqBiB8XPcfgQQ565X8WQgIzM1iPyNqGXUQW7IIVzYlAU
	 lXLtcS3qDFLfqiH1TQKxGKu2zzTDyvzbei2fDYQy2q3Yr7zY2F9WWRwRwKmlMlfNJH5xA
	 JALoiDEFXbt2Ynehka9ijBs41FayuERP0SejA5EyE379vqGaf1xvd38TwkWO5TsfnQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=RqJ40njA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541E606A31D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Oct 2026 02:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9541E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=RqJ40njA
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so3393596c88.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 24 Oct 2026 19:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792896789; cv=none;
        d=google.com; s=arc-20260327;
        b=WAP9KtwgcpTygwYTdv6Dx9pOkgjNK5orMzdkTp6nCpPj7CmoT00oKvLuhKm67ncn2H
         r0/jl/HpcHy7L4n+ztn+oSK6l635PTKiPABsjPbMW5bXm5oBuJV3gU5FFitLfytIftQ5
         eW84DABzLkj1XMn/SevIJupgzRxN3GhK1FJUj5RoF280h5wi4c/0EX2VVhoKyRjCaHb8
         0Z1D4KzP3sB1vIb1MXreJd8HZo4EBUvwe+s0KQQUtDeotucHmU6wD3u627acUX0NAqdj
         shm3RVgWWbxcjtTEjGpcs2FF0QNuJdQmEfSqVhLt9nI4DJm8hir2xlI4oAY9TUk88zQt
         Pe2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jHGtF+NZaI+hhPHPeZP23JdzKtyfeu2RME20H6dVyog=;
        fh=F38UJNNTnuy76dUBtfNmyly7ONb2ELJtjg9OnMAS9kA=;
        b=OUM7k7u+RRFpVR8hJ5zHzgf1sct6YaXo9if2CTSPqiLJQ5axe5OyWkqeh00gWfsr1H
         Uyfb4212nTOmygvqeChsSyGE8SeHlywNbXD+m3CebvGaIT14phZidKwZ5/iMvaeesN9Q
         cCuoCanvTubxlzWb6vNap+MgWs6s2G+bOjdw65Y678D+sG7AKC0TXSgifVRnIAXxCjqV
         3uWZpUpJpx1j/m/lyY7z3k1F8TDZ0izFQNkBDHIIP8l3GOXr1cVYfTXiJrbX58JeHD4A
         tsLnRz3bkI95nE6s4CBi+5pXjPiMKElU5Rip6NA47wIyMGNE2PnWUuXnxEk3QdvMQ0nG
         j/qg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792896789; x=1793501589; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHGtF+NZaI+hhPHPeZP23JdzKtyfeu2RME20H6dVyog=;
        b=RqJ40njA9pTckTuF0lYuc5jikRwOO3YwN//RGl3KuJOyofhostQyOs4TFSCQDXuimN
         mrhExp59kXaQHpfE1y7ZjUfzwY/tkhMYYt4svlVRCkqoTBXHmLYoTRNfvNsM1KCddwP5
         wZWi8DrZHbt4tzVZg4tDPhtTtysbrpZyS49Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896789; x=1793501589;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jHGtF+NZaI+hhPHPeZP23JdzKtyfeu2RME20H6dVyog=;
        b=rHvZIqbxYaC07FJlwsIn/hdzbc/jqkmx0yCEU+b1CFlFB1olUL5JPShcmjf5BpJcbq
         M+pYlwZ+YqssrQYv41NAD7j0qln2+JlxX5qwb4Av7Fz1Jq/lgg0RECtlvpN7ONZonfZA
         6AkM4z+9fRI7V8DS/7XFhO4oujWnVkYqqkWu1ISTEN+VXsC0POWOrNkQbZjbOGrCF4S4
         Z2khT56JsrLt6QNdhjanzR97Jl2YovkPAVzBQPmEbBpixN/TiJSxIkJ+0lfP/n+koAdZ
         XB1wOeRkqZgy+GPG70xyOiqAj8oH7C/1eG2G+4BNowOQ1m6dD2tcFVnU75ZgJIYmEMtQ
         yuTw==
X-Forwarded-Encrypted: i=1; AKwUvBz60IzQn/nGRVSZ601TnRX26DEPC6ZvlV2ogxTMhwZBR5MtZS0D+V1Qs86aElEEphFEA0kvjPsSM8HF@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYKgqPm/kQ8pT8rOozzNTeRSYYVxkgguzNJ1pUFS5XX5JSbA414w
	81BNBX2hJljSKeIIFJWv0XseS7w6X8kRxzODxylLxWKHlgd47sI7CSONEgZVGfjmMS6SBlYW6jv
	mUrU/Kl2czbAi3lBl56l2lX396eDg9Ebf8cZ2eCJveA==
X-Gm-Gg: AYBFou0INVGkkHupDTOFJiYxlkf2rSZcAL8sQLJRwDTfkHXFC1/IqLk7bz1OY+1cD74
	1TnkJwVAmya7CNrFyD0GhmAi2eeZDgBLSTScL8Y6xi52449TqB+YWomGz3pygs7/xMJ8rnI9t4O
	RwuEUKyKW0W8YNzDGGf+AwgvWbsXu1Nv60XMkrgTzOtato9a3kIXwvKgKkjYly1zgAWEO9f53uL
	qa6wH67hG+LGxIBbTenQ/7VIAbl9emVJDCCdDmQ+benjzjVYbBkfotLOCm16vKJjqIk8eIIf9vV
	I5/4iavnbRrrrj0OgzpSuQ4VC0O2XajTYeT+wm/CHm5ZgpCVk/siCJD/ID9Gw8Y64xcl9M0MBO/
	ZpWDdrjB/kOMBDdMqhaKQM3+TbnoblRRWAiwl
X-Received: by 2002:a05:7022:b04c:b0:163:3bcd:e5e6 with SMTP id
 a92af1059eb24-19934a96f4fmr5011598c88.24.1792896788514; Sat, 24 Oct 2026
 19:53:08 -0700 (PDT)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025024514.802862-1-daniel@0x0f.com> <179289664421.3327.13269797237144711675@kernel.org>
In-Reply-To: <179289664421.3327.13269797237144711675@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 25 Oct 2026 11:52:57 +0900
X-Gm-Features: AclHuK-izwE4tuQ9_k56qieEjJy4dAKE5drC7e2460UfCl4uONeoDil9BFT3OsI
Message-ID: <CAFr9PXk93VVxotS-C90Rhi+uuk0BJngTAoMVQqWkfh5dRCbdcw@mail.gmail.com>
Subject: Re: [PATCH] net: i825xx: 82596: use MMIO accessors for the MVME16x
 PORT/CA registers
To: netdev-bot+sinfo@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	Denis Ahrens <denis@h3q.com>
Content-Type: text/plain; charset="UTF-8"

Hello bot,

On Sun, 25 Oct 2026 at 11:50, <netdev-bot+sinfo@kernel.org> wrote:
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

A version of this was tested on MVME177 by Dennis. Dennis will
hopefully test this version on his board and reply with a Tested-by
tag.
