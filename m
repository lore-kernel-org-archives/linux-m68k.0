Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C953FBAE
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Apr 2024 04:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714192910; cv=none; b=lBsKDp72KnC7temyDj8z+u6YIye0y3V+W7td8/RiTx137dbz2uGXGlbl5wtAMkAxjlMtnCKKFAdQy6wD1ifOhvuntpF4ZVimIr4Kjw3y3HGmvtwYi0EUyN4T7Xz2zVFtsY4lJ0hjWwxxW+9sIvPq/Ti/6nMeiU+Bzk6XBtVS+Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714192910; c=relaxed/simple;
	bh=mkrCkRcn1VBHrnOzRtenLtYFvWboqf1LwXdtSY/+31U=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kkffvsrD4bo1mrSkxrfVNevHbOXPh/y3S3D3RKLLYicMUZ6FYBeGRgP4EsZ/NRMYSgXhzf2R9Je6g8rCMLsRKpL1J/pr3UwncVUledBiwTwJaNPjcSmLCgk53TenUuKjRa3B6OGQuqys3PH2YD+W1QOANGGzdnYzT/LzpaO6O+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDQu/j3g; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDQu/j3g"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f103b541aeso2471370b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 21:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714192907; x=1714797707; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2hnwyl0PdDlo8QHJFha9Nkk1GZOjhLF6ZXzdu29wtM=;
        b=kDQu/j3gHOkL7RcFw8xpXIZNRxrg1rfC4yz0EzZwRZHxreI4Dv8qFfeR1OGywzW5+Y
         x5Al6STraramtp4VOgCYJcGgn0S17WnXh81uh0ZDzULadEI3M26iZl46lYWbOoRiykrr
         1sGSQikK3FTSBzAMrAIU7YVuDsvspw7Wj3gj/uKOorPny/TjKuOEMD3KsCNPiqid67UV
         SnjLntb/bbhGbvLFBGh+46Cy9CfOcNRBTYqBup7RO4xI8Rd8jUTW1fzQoloE+tcTewcO
         X1MH5OeeK7p7nHf2wrd4BSxptkDB5K3jJLLpc3VyoS21kYCdzB3IMKqf76OBCBHhErhH
         9cDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714192907; x=1714797707;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F2hnwyl0PdDlo8QHJFha9Nkk1GZOjhLF6ZXzdu29wtM=;
        b=Z0sEQcoCQaqg3+CcpIBSsii/kFSUEcOFn4fDHbc2lb2BM8CNwJqn7egtnwYb8oz2eX
         IHF6z5MsED7wCnjRcBSot5HKndBgmmFZMDNkf6QwqvLPe5iwdksbvGCL6HGAOm2udgI8
         RCkgXsabzPl689xmYSMWX8sCJyVef2MQkt33Im1Kn023BC8dyfTFfzuUQHlgBRpfEmei
         vPl5RQ0XMULH17tgguTFPr7kUXwLZvbumzyL92S7pjHqH4H4+2kTH1vXIucAiPvedcaq
         tTb8Gpgkr7KPft637EjAoOe3gwskJK2GCHymenrKbif0omALP9tBgod2Ls+/OvZtRXW8
         T6rg==
X-Forwarded-Encrypted: i=1; AJvYcCWS8gCv2d1GuFEpakqizW2EmbihrXzQ8U1tYT7Bkw2QsOiUBEr/8Ku9ykvor0EeO5vJptnkF/qfD8QqX1qbijpwmyc0+MURb2W+ziC48STC
X-Gm-Message-State: AOJu0Yw6dQ/ZyVxgxZozKTkUuNSx0PE4u8MVCbP4jDz3EmbbMm7v9qoX
	YslV4fKdNe2OmLLxPNY26r/GKaZLdQOAsN0/tCv/4Rm5zKdGeBiYBBu8xw==
X-Google-Smtp-Source: AGHT+IHxCiJuHiL+9XOpQxpVSB/jeg6ocQE9gNlOkAROUSSiJSBErT70ylBWdl3URA9tLF78t+19/g==
X-Received: by 2002:a05:6a20:3206:b0:1ac:e379:542b with SMTP id hl6-20020a056a20320600b001ace379542bmr4433438pzc.3.1714192907267;
        Fri, 26 Apr 2024 21:41:47 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id b1-20020aa78ec1000000b006ece7bb5636sm15584288pfr.134.2024.04.26.21.41.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2024 21:41:46 -0700 (PDT)
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
 <ef3430ab-4dbb-954b-8bc3-7abf046d134c@linux-m68k.org>
 <77b94911-a58c-6f44-7c92-dbfdbb403bd3@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <7db9f286-74ea-40a9-9849-321aad954586@gmail.com>
Date: Sat, 27 Apr 2024 16:41:40 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <77b94911-a58c-6f44-7c92-dbfdbb403bd3@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

thanks - tests (including __clear_user) with my 030 did show one Oops in 
the same place that __generic_copy_to_user did last fault, that is, the 
btst after the movesl instruction. Adding that instruction to the 
exception table avoids the Oops.

A range of path lengths as well as offsets tested. Still some tests 
pending... Couldn't find any evidence that a NOP is needed either.

I'll post the final version as soon as I've completed testing.

Cheers,

	Michael


Am 27.04.2024 um 13:44 schrieb Finn Thain:
>
> On Fri, 26 Apr 2024, I wrote:
>
>> I will test it tomorrow. I expect that a NOP is needed at the end of
>> __clear_user.
>>
>
> Everything seems to work now.
>
> I tested this series together with my own RFC patch on a Quadra (68040)
> and IIci (68030). My tests covered getcwd and llseek syscalls. I tried a
> build with the extra call to __clear_user() and a build without it. And I
> covered a range of working directory names.
>
> Tested-by: Finn Thain <fthain@linux-m68k.org>
>
> So apparently there'e no need for a NOP at the end of __clear_user() -- on
> '040 and '030 at least.
>
