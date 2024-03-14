Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DDF1A38D6
	for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Mar 2024 00:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710377971; cv=none; b=iWLX3po2C+2idYnqHp99LejlcIIq7DDzLyJsvrji6gpZgW6dN18FrOKlCj94D+Io2AA6Cmi+ZFfHgDE7CLdsebe2beHnHXG7ZQpyFtm0PIuzNPKyxNvUUQR11dGl1NmXqdqwF27P39iKNy+5V9XiPguG8sx77JZroMNakJQh/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710377971; c=relaxed/simple;
	bh=Rt6/JYH7icOxNrEDLTN8nIc867piVign3wBV+ruuwho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDDaGZzoyj9pFh/Ry9oe0Bepm2Iv8zkoAL8ibnegP3uD/qXJfGjEcz0xX6quamOS/eYSpgXkgFm6rQCcWnX7eqbYAqyr/RX8m8+Vs5HdY5EuwexORIoUS5DurQ4JJxNLipkqGXrQndKq3CjSPYKTBv3Cg9VAxK/zkAkDl1csrXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmM3w7az; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmM3w7az"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dc49b00bdbso3025475ad.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Mar 2024 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710377970; x=1710982770; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VVceorEN0SoUk6UvDCl5qelmoMph5c/rIzpzaFnE+g=;
        b=JmM3w7azaIW9G03ISDs4h9erm4GxK7JIwNJBDGmIfolGeoRUnIQMmqcUslevRoDBDP
         f3yGByQdEl38abIWuKhHkHtFz/Rr1w4CLzeahG0Rd2m2bdkNqU/8gXNPFKzHhggqbkyQ
         i4vNv/s5bRrpDzz6diThoH5rIJlAFl80hp9hz211zBenocBMpsIuwlonnzLQK8SUafLg
         /zUESdvsns/4C1ZGbmoznVBafNOk5DqzsC3gg9+ft4JFSOR1w/oY/jQTBw2PRZyr+EH7
         9bYw9f6sEDAD1Zw3ps+4g5yV6iXilDDMzX8m8Rw+rjhrtLuiJZY2RkLXOgr5+ihW40x+
         zE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710377970; x=1710982770;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VVceorEN0SoUk6UvDCl5qelmoMph5c/rIzpzaFnE+g=;
        b=cpLGEd33W5oui1+BFXD6EztomOB8uzLTdwEom+0oXA2LayoH1gYLkaMH9D/hiC98Fk
         byJH1HWUa7FqxvttAdLk1v4qWpm9Q7qtHEC3cEcKhVeQT1vTmw0rc+LfG3Qx62pMvKLL
         ENVeDRh8cMuJo0q+qjYpN8HlfQK2x9GQ/jLqHObOyFpNQ4nkha2gRdflSjz5uVRv0Vt9
         fb74Ioo3Ory8pZpUUEBJAbZObYVZrBjL6gokWBCsMB9C5WynkwLm3MKKH8eEIHqc0NU1
         VPLUBJQYAJTdTx5ohAGZL9iU+UCu/Qb8ZRvAM9+z9Q2qoWIqeT5+rLqtb9e1MmYrJXBo
         X+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXVKzsQqBGgiNImLBJaX2CJwtB3Wbe4eHR8p1M94HvA+OxhNcBWL+iCdYdiE2GpKKYB0hKzn/Veh8cPI3GflO7KjO/rUx+BFlqKtZ3NulDk
X-Gm-Message-State: AOJu0YzmiQVXuRz7ZC6NVCfv0rUJANAE9r1lCFU1M3WbiqK+qmLOsV3W
	TvfuNv0tc4jLnnrVmk65XrTqyJawLZIX/L1hII9Gbv42mi/kOAtd
X-Google-Smtp-Source: AGHT+IHk4qA/hzeYwUiYEKE4qCZM2bxrIVUbUE3WNShYG8f5wcihR6Xo/4etGenu/OzbKEZzNoO/hQ==
X-Received: by 2002:a17:902:cec8:b0:1dd:9819:5394 with SMTP id d8-20020a170902cec800b001dd98195394mr453728plg.49.1710377969566;
        Wed, 13 Mar 2024 17:59:29 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id jg5-20020a17090326c500b001dd6e253f03sm244601plb.212.2024.03.13.17.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 17:59:29 -0700 (PDT)
Message-ID: <7d28d5ee-176a-49de-a93c-76e03913cd8a@gmail.com>
Date: Thu, 14 Mar 2024 13:59:25 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
 <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
 <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
 <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
 <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
 <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
 <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
 <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
 <028f8edc-a08f-571a-0985-275394b60986@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <028f8edc-a08f-571a-0985-275394b60986@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

On 13/03/24 17:40, Finn Thain wrote:
> On Wed, 13 Mar 2024, Michael Schmitz wrote:
>
>> Running a stack-ng stack-fill stressor triggered the panic, too. I'll
>> see how reliable that is.
>>
> I see an immediate failure with full preemption in QEMU when I run
> stress-ng -t 60 --zombie -1

Seems to work quite well.

Though what I got on the first attempt was a deadlock with full 
preemption in ARAnyM. No panic.

Time to look for a solution now we've got a nice test case.

Cheers,

     Michael



