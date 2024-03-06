Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399E1B5AD
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Mar 2024 23:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709768790; cv=none; b=GGdbEamnSYVNdycgXff02sqR2TqIqb9ht0UChSp2jU8zLh8oB3RC5CGroOlolggknK9jrp6rmvG/ss+Wyqqjid945evd/aYoeXS/KL5Q44gNZUU2vvSkWUJGQuuk3Ff0RxWTjWRKG846lkNlVY808gOpAdceEKJR7RywDIA8DZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709768790; c=relaxed/simple;
	bh=7TDV7C5PNt1ZWQWsWBDWnLXuBpQFRK8oB/TQE+ONtrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRLEiEoggOBc/jLPtwPTkIBYqazMKHxfCD3o0JhW0IJxF6pda9x3XAnYwtrGdehOwYxShhjhf5Nyaf9aUYu2LwgVDlwkzFlaV6HueyAyHFI1wiNYCrywFcKGcs/hAOQMt/M34MFR8t7ZEsRTxVCg5GYrlI7w3eTeUNI9Km49ctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcBOP2DC; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcBOP2DC"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso198126a12.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Mar 2024 15:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709768788; x=1710373588; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kqorcUr/mN5YrTuFjYVBoCO3aBXzpm1QuyE+7s5X7fQ=;
        b=bcBOP2DCPZK3j8T6FXlKau6K1tFL/wpTZm6DMQsMcOqDt8zeXU4jNUA225cxuwOA3j
         hERXs4gaTR33vfTrBw8nEMrgAgoncFIQyLGlXz92BfxK7AgP0qRBL9gKYNLlhSMccnYs
         17Cshd60i1kggE9bvTNslMUbwV5o7mK8pA5Edko23zM0BhA9Sob3eWCSxDzVjyVsQZTT
         tw8VENsX+VXtNo17UU2dwxpWFRwjYBSHzYXE86+t2MxCoC9N6fLkzVqmuTlNipl3krIG
         rfH3GxX+5RGpM5dOQWRapp/G9RkSJgTkET03JMQKSsqMIDJYruAYfklIAfXr4rEjybLH
         +VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709768788; x=1710373588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqorcUr/mN5YrTuFjYVBoCO3aBXzpm1QuyE+7s5X7fQ=;
        b=U+5QZyLXGVR7EXmaUUerHt5nQk8pI+yOOyKFcjq4mKcxP2r9AkEYQApkRUprP4YyBv
         zJOAuUHh52L6XK/jhYn9RbnxLzLWV1drCZ5M0BkqxLqg8ltu5po4C9GcDJh6YFvZ9vE1
         bBo1Lsz5ZCM/Xr+/cYWWO595Xh0815Y83uUpQshyjKoe/Hgqt+IYwNwNKmpSJfjRZ/EG
         Smkl4LFQJxk+T5UFJGa9cdIaP1W8nn6AX2ysE8LZKXp5R4hnui77H6SXpHcSaM5Tllsk
         PToNkPhqxFkigrpAmfEnII6HZ73e29CNBHKhe/RWaS3SU1hYetQc6Oum67RQHAiHy2m4
         EXtg==
X-Forwarded-Encrypted: i=1; AJvYcCWk4Z62sLz7qS6Czo1qhMTDD+z/zHgIixG0keYJNLTIPG1TzrIkQs57FH9wqWN6CwPmYAjGiAor7wYLgPlPZQRPcbSV7TncqunLniQatrLh
X-Gm-Message-State: AOJu0Yy63+6TxUfalTYeG3NmBwIb5UPtPiZ/K1XQbB7xWlkbdZ0hzu4F
	O9NmkQ4CcbIzAR3qlRgJkyRCDpyk79VLu2qQTZykkKIDQlgcSZqg
X-Google-Smtp-Source: AGHT+IHBrb90xizMLfIruWFV9ShELL6jGDUOVm8qJiC/XAwKiW/8uwZ9m7NCzOKO7M9UPURcpV0Y0A==
X-Received: by 2002:a17:902:cecc:b0:1db:e7a4:90a5 with SMTP id d12-20020a170902cecc00b001dbe7a490a5mr7651480plg.12.1709768788379;
        Wed, 06 Mar 2024 15:46:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a11-20020a170902eccb00b001dd08ed9eeasm7615114plh.259.2024.03.06.15.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 15:46:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2e1bd0cb-aaf5-4b52-a784-081dcfe65e1a@roeck-us.net>
Date: Wed, 6 Mar 2024 15:46:26 -0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>, Brad Boyer <flar@allandria.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <20240306083054.GA20607@allandria.com>
 <212aa3c7-0706-f3f6-5bfd-c8146e5192e6@linux-m68k.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <212aa3c7-0706-f3f6-5bfd-c8146e5192e6@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/24 15:13, Finn Thain wrote:
> 
> On Wed, 6 Mar 2024, Brad Boyer wrote:
> 
>> It looks like the Q800 supports switching VIA1 to IRQ6 through the
>> alternate IRQ mapping.
> 
> Yes, and that's what happens in QEMU. That was easily confirmed with the
> patch below. As a result, you get less clocksource drift during I/O but
> you also get a lot of interrupt nesting.
> 

Does that mean we just have to live with the warning, or is there a possible
solution ?

Thanks,
Guenter

