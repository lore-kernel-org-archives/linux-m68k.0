Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D2145FF3
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714120281; cv=none; b=MLUlgz3xjPhJ8vQ5cn0zgXWMUjvXyuNKNa8GMl+ijHFBGgCoieI+dI31SB12546hRIfrKYSlB3eenkfsC7QgGae3MaRwM+R7WdR2xszwr4wPPn/KthOO/LeJs/sSmj9l+PcsAEokm85EogxD65k9AX+Yh4vTVwiHK99LSlesuow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714120281; c=relaxed/simple;
	bh=W5nfk96edcCG6pIHUY3SQ/u7GTVa9uzYERB30KCL+zE=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=KfFjyQO2itT6QoME4b4a8gXqnupxIdG+vdnQm44jjLWe/9AnITWZSr60VYh96RRKKkNtMKLShbLi31T/3VGjXGkAyO03VZSxn72m6yknGGU5MCGeRz5Bnd5mHofkYXUUFAlMcpNjiC2OiO1OfJpye3Z6v+j7TsNJEmCvaTowQDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZzNEKwN; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZzNEKwN"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2a6fa7773d3so1619574a91.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714120279; x=1714725079; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUIFRcW+J1wOZNl+yCGuRP8VE/XH7NBvU/5R9ZHRPmw=;
        b=XZzNEKwNzg0L6MHYDAu0pqdrgVqFnhRenzsci9yEP0/hFJiPiorybXEMYQnSLgvy13
         SeA72S8iiIOIfNWE8TOqWwKWy/RG1U3Ej7tDvnW7aFN96PVYvtYgkBscq2GSBKogwKj8
         lrkmRXg4vz4L4hYuHzt+/ZXJO1pVmLoyXITDYZrd5wQHck9lq3914ScleSCfP0BWpqzy
         Yhp6raesgGGZotsDG00m/wnqcI62h8X+BB+VwAMHGQ8ap9rv+ilBex34LLjqRZEvGoGG
         UlFb2HP7GLq7DyyZsTjS7usYjBN7FU7CP1hxynWlJJ/644vBaOBefB1U/cfNsTUHpu+Q
         WIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714120279; x=1714725079;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yUIFRcW+J1wOZNl+yCGuRP8VE/XH7NBvU/5R9ZHRPmw=;
        b=CkGbGK81uy7AroMaGXuMJ7R9J2mHysaRdPs51Lff3jkezyaROBGo7KFejGAwTy5eYR
         Z2Xl8NI9jFC7j3JKWmF27zwD00l5Nz/tnYu5lrGiea5BMrKoBea15l6g10N0wxOoD0rZ
         qcGy5iVbNLghyIvVobDEctUubRDC8zxisUrFWt5wlenS4Tw6YSUeDqXwi2Lp/tDFFDQ8
         cBhq7rypLKTh/5YBeH6aHPv5ud1fqcw2gpdeUnbPm9ux4121+7k+aHzc7OxDQEp0ym2N
         TxvaFeP/GSsCkxsLWTeWEBTaizy2/zikUsYDU7D3jEi6pGeU9fBb7hCoS0222RkxzEjC
         BAtw==
X-Forwarded-Encrypted: i=1; AJvYcCU7mL/W0JYoyUQoiIfY6yzME4If+/HbTfyfCsO+McLHzX42sPxGG/BVIM3l0ndwvOxe2CW7h5imalFKEbxGzPtqv/UVFYF7JMP4DPy2jBun
X-Gm-Message-State: AOJu0YwJc0FPyIjXU5MwSjEqJJJdRTiZqdazJkBysZrcH4lOTSDQ+OCc
	GNU3t7TanFRdR1GQtO1FnvjS3jXlt2e9A77hyKU6qb+GNvg6zgMeiMeXDw==
X-Google-Smtp-Source: AGHT+IF91OD9AOu5vSNqPcDGM74oWlKAb1Na+ya0Vorc6QtYShO3XbCQ5VOne0FE1WTHrxzo5Qz0sg==
X-Received: by 2002:a17:90a:df11:b0:2ab:9c0d:da69 with SMTP id gp17-20020a17090adf1100b002ab9c0dda69mr1637660pjb.49.1714120278626;
        Fri, 26 Apr 2024 01:31:18 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090a1c0800b002a610ef880bsm17509833pjs.6.2024.04.26.01.31.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2024 01:31:18 -0700 (PDT)
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
 <57b70e03-2672-4f27-87f9-481208173a20@gmail.com>
 <b9d281db-c06e-0eb3-0f49-b95f576a9891@linux-m68k.org>
 <1b49c8a1-c753-428d-b526-06b6eb3e551c@gmail.com>
 <fbaaf75c-c4e9-7fee-bb8d-9fd0fd25b197@gmail.com>
 <47b70044-a1d0-8a06-d17e-229c613aaeea@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8d3ac0f3-2090-a487-461f-bc1d864cf409@gmail.com>
Date: Fri, 26 Apr 2024 20:31:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <47b70044-a1d0-8a06-d17e-229c613aaeea@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 26.04.2024 um 19:57 schrieb Finn Thain:
>
> On Fri, 26 Apr 2024, Michael Schmitz wrote:
>
>> Similar tests with start address five or six bytes before the start of
>> the unmapped page, and corresponding path length to be returned by
>> getcwd have shown no more Oops on 030 using the attached corrected
>> version of my patch.
>>
>> Please give that some testing if you can, and (hoping it won't show any
>> new faults on 040) I'll post another version of the series with your
>> Tested-by added.
>>
>
> I will test it tomorrow. I expect that a NOP is needed at the end of
> __clear_user.

Thanks! I'll add __clear_user at the start of __generic_copy_to_user for 
my tests to check that.

> BTW, since you're changing this line, I think there should be a tab here
> rather than two spaces:
>
> +               "11:    "MOVES".b  %3,(%2)+\n"

Well spotted - I'll change that while I'm at it.

Cheers,

	Michael
