Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750554A24
	for <linux-m68k@vger.kernel.org>; Mon, 15 Apr 2024 01:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713145147; cv=none; b=BSW1tjlMtbJ8JL+TQYM0iceAAFssNNsdhHjxJxLTSkKGAKOG2zWALUlh68aarW1EjcYymDH15/cSygSjuDl9WYmwhAuCJAUrYUquqqNPrWAd+Bby7v54JWR7RGnAM7E9wXo8WcpJbtbJzz/G4UnFDhajmX/6zU3uTeaxnogZEgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713145147; c=relaxed/simple;
	bh=dk0B2+4qMMKXvVF4ZUTDX7I0s9TZE+/Kqoo2LZHIaGQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QQSCLJoIn3stp0O1Y/PjRgjyk8VZ+7p2UaNWNUXJaMFZHNAxr69dTAzJpFt/5OkvSxcb7Cwh/m9AwWBHBSdoqoFaBV8RpRqucMdBcgZSUt5AQOQe3MdwMKC1/Q1dSP6Dcp29L51MbUFai2gW9zQCwYlhB0RcyhXkna3MPo/yIW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTyXTwKc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTyXTwKc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e411e339b8so21139835ad.3
        for <linux-m68k@vger.kernel.org>; Sun, 14 Apr 2024 18:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713145146; x=1713749946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hqsZG1WXTdb2I++gZ3/o9UUJfvAjJC8XTDanTajOqbA=;
        b=QTyXTwKco/cELM9Xfyqe8+h4WIZlzORubjIWJaAE84I+YMDDNPCluyalpDA0eI1H+v
         +o4JeOZcDEApV7cOuyWoUiWa9tBfqnR+dR+EiYZ4QhzLQb8PmgpoZA6LyT9/FeD3/1G+
         35WqkOc1TtjvhpnixpAD+WwFkbPxUBZ2d762GG5JT0lCP3takdwWrBftPvEbHaPIKxh1
         45o3bcAXJKwwEJJEYlKorNf3Y7+e8pT3UGJcToN4Nk7pDxDWs5sxLdNC6hYYT8pL9RJ9
         n9pZM6adHgpX7veyjuBN2186H66Gho5b3immNkGA68xnMYtJ+0DDGeZRlhPJywLdiYMs
         dMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713145146; x=1713749946;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqsZG1WXTdb2I++gZ3/o9UUJfvAjJC8XTDanTajOqbA=;
        b=eHS223pvrU0ZVapbLo713Bq++m58c9kuSlPQVJyBBS3VdsDLkrcDV6W0dDJ8m/ojpY
         e4rWqQmiNTJhyGGYLYxJ/uXc9mS8WuqUb+cuYrZIdxQ4Waj1gbIBI8QXls7nc83+v21T
         MHmmGsbx5Thgo/XW5XQE1obMN+UIYqu/Rmi7vfTtjuvwzYEdpykQxdLuZlPI2L33e2S7
         3TAAIlzrVjR7NcKplrPQV/LSHuIhjNCYtvcVJAzl+LzOTxYkkqvZ2MoZCtwYttvxFOqm
         AllN47Xem7TK0eBAoJqhlsXm6y/L0bJ1bHU7HuJnmPMtD4MD9+5M/rHZAT0wqzUyEvhL
         hKbQ==
X-Gm-Message-State: AOJu0Yz2eMDFRAFHgLnLwHIgAHivuAZsZm8W9dNhedzBAwL3jkgQdpSt
	kkg7z71X8VQNE++XNo8l+kgx8TtYAjKQ3jEd/DO6RTWSkoN12e2THQbkxw==
X-Google-Smtp-Source: AGHT+IEYswK7Mudxe24oz4qHW+yM/hi4Nv1KnY4mAVfeL/a7vGyFGwyRQxsKZ1zV8DXpTMf/hmtNSQ==
X-Received: by 2002:a17:903:292:b0:1e5:62:7ac7 with SMTP id j18-20020a170903029200b001e500627ac7mr12584442plr.3.1713145145728;
        Sun, 14 Apr 2024 18:39:05 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902a3ce00b001e3f54f90ecsm1300080plb.300.2024.04.14.18.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Apr 2024 18:39:05 -0700 (PDT)
Message-ID: <4afceac3-450b-4ade-8970-5daa879183a9@gmail.com>
Date: Mon, 15 Apr 2024 13:39:05 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: MFS Filesystem support
To: Josh Juran <jjuran@gmail.com>, The Mariocrafter <kayvonkamyar@gmail.com>
Cc: linux-m68k@vger.kernel.org
References: <CAEgzAWxZOMZYSzsiJJxOAy5otCGBvOZe9STGdjkkzWZa5p3dvg@mail.gmail.com>
 <CAD8FB7D-F3DD-4A0B-9388-EF88FF52CED5@gmail.com>
Content-Language: en-US
In-Reply-To: <CAD8FB7D-F3DD-4A0B-9388-EF88FF52CED5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Josh,

[resent due to vger reject, sorry ...]

On 15/04/24 13:25, Josh Juran wrote:
>> It would be nice supporting the MFS
>> filesystem natively within Linux, which could be read-only or
>> read-write.
> An alternative to native filesystem support is to read and write disk images in userspace.  Aside from not increasing the kernel’s attack surface or imposing a licensing constraint, it has the benefit of being portable to other operating systems.

My thoughts - something like hfsutils might be best for this purpose.

Cheers,

     Michael


> For example, I created a (so far) read-only implementation of MFS for Advanced Mac Substitute[1] (an emulator plus reimplementation of Mac OS for running 68K applications).
>
> https://github.com/jjuran/metamage_1  (see 68k/modules/ams-fs/MFS.cc)
>
> If someone does seek to implement MFS, at the very least you might find the comments useful.
>
> Cheers,
> Josh
>
> [1]https://www.v68k.org/ams/
>
>
