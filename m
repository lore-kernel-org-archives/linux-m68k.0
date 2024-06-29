Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8EA1CFA0
	for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jun 2024 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719648089; cv=none; b=MC3aeD58TFLmTneL+YAe/UGlTyx5dQmyCXTjgUAAudlYnHGf9A1Q96biODvmJletGboqWTn4IgFFtdKS/iTot73EIuy4iTEIbIVCesInKH4VFIz7r/WLUmaPE9tET+VMIo0bY02lE8qtZ2gbFppgP7EhF2YJzHI7PBJf0z1bdFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719648089; c=relaxed/simple;
	bh=r4LWM/CHyT+2te3GWUIvsv2k9+gDqMc6EOdmfz/9eas=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DVRCpj/kIGVImVmhtlC1dHrH1RlWjvTwCpWuZPCfCHa+UgtH5+tH/OzMjkWaB86rWtSz6is5KZ8Ppm7tmWJixbeHguldQMLOLL62rt+o6sCsLm2NVcDt9VQ5orO7lwKqjGGwoAuCZ7xWLj+E4CZJUEBLbdHAjo3VkxyrVMMT6YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJ1D9Jrh; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJ1D9Jrh"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso1017470b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jun 2024 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719648088; x=1720252888; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVZFO1FkOZN43VwhDsUFI8m9w2uZibjKDiWK6PAbrwE=;
        b=AJ1D9Jrheq3eewFmtVcCaWF2Fit85hF3wHPRF75m1TUvJEYXoJJ+AchSqxyNxil3GD
         RxmR+Vsd9QdqCouyFkPuXmmipOFlIvxrzTXw3SXTtQuTLX1apJUJ5pOHgw/1t7U6xE73
         QaFZl4nc2nq5pVNtJGmj7q2ymv/NcNEcOHi5qZ4Y/l3NCogm/Dw50jjyyZh2bvJJGHQ3
         LS5U0It3/YawTEkCgSd7Gjr7WPQLs8C5igbSGrAZ6kbElO1z1B4LARbr6NwyXPrfmAAa
         0XhyxBpNnbRGwKH2G/4rOVV0c9Q9obHqrVyB1/h/Unsr1yDZYLJB4wnAvqXGJ4/H4dGg
         cMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719648088; x=1720252888;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RVZFO1FkOZN43VwhDsUFI8m9w2uZibjKDiWK6PAbrwE=;
        b=Fk8wJfqzYwu9SJ4Nqrwc6deIgU0smPDxe1Odn2OwTNPVmXVZpOA1i8IBLpPJwneZrr
         9t8RNgk7PPamnpzmrgqYJ+oxisDX1/b7CJga18UUFHhCcELXIu4yJ3VCV/32lPJXQQns
         bwuLSF+SjQ0g+akixmDMKkiA2CuKujrYpGZtJFHkKtCESxfe3mYuOfQUghulnBw5ywTE
         yhWBfO+pAXzsP7bMUnXGdusozfDlA66Q3LGjtrOHZL+UMBMy0EiYLV54kan57YTU/z4I
         hSvNZbVHaU/U8F3Z0NAwMoo7jFihayS2rPC96QU8x/wl3sNXCrcoMyfaskrzqeuixBq5
         9w+A==
X-Forwarded-Encrypted: i=1; AJvYcCWfCpErwDu8n0CbnMpWItTukOhE0TXOj5RlJBq6yRpGsOu5By4KF7rndXDfI7wG5l3VN2ENHdAURJjeeNyZ+ds5G0BvdwHmTK7LI5bjNXLm
X-Gm-Message-State: AOJu0YyniVQV27YJt3l/uP8t3iraIzPDoYwSRQe/Ynb1519T6Et1gjXh
	whN9Tqv5HfMJ7LEf7n01mguHmwNUh8J5j/9giM4n/yrtOOvWnIqz
X-Google-Smtp-Source: AGHT+IGbKv40OC5mDaOBFOYXNNOUwtkx3qqlTzN5ZmmL41H/SNbMVh1aYZxa8FS2RvtudOgVTuELsw==
X-Received: by 2002:a05:6a00:1ca4:b0:706:68ff:2bce with SMTP id d2e1a72fcca58-70aaad1e232mr458676b3a.2.1719648087517;
        Sat, 29 Jun 2024 01:01:27 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70802565b3asm2768066b3a.53.2024.06.29.01.01.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:01:27 -0700 (PDT)
Subject: Re: m68k 54418 fails to execute user space
To: Andreas Schwab <schwab@linux-m68k.org>
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
 <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
 <57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
 <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
 <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
 <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
 <04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
 <8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com>
 <87msn4z15c.fsf@linux-m68k.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c7203054-2839-eb94-2be7-b27c0c3c7770@gmail.com>
Date: Sat, 29 Jun 2024 20:01:19 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87msn4z15c.fsf@linux-m68k.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas,

Am 29.06.2024 um 18:57 schrieb Andreas Schwab:
> On Jun 29 2024, Michael Schmitz wrote:
>
>> No heap space allocated here. I would have expected that to cause an error
>> message from libc ...
>
> No, the heap starts at _end and there is still enough space before the
> next page boundary.

Right - not all that unusual then.

Thanks,

	Michael
