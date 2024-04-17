Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67496BFA9
	for <linux-m68k@vger.kernel.org>; Wed, 17 Apr 2024 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341302; cv=none; b=cnZhpkp/CQs9K3AvU+fUSC4uHoVecoeQlACcNuKDwuc2vYzJ9ubfNBhGQdE1OhStuVdKkkWV93tv/xQJudsx0Ub2jhUUvwHdlLEMjDbvEomMwTeu1i2IagXIk3MjJnEjFGaOVb3LPtB5NKqZvgpsP3VCGjEGbzzJpI0VbuImgjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341302; c=relaxed/simple;
	bh=DXPWZFRaQI0yKoVX78JhHtevFAvWEQhrimlJJu6HxVU=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AZ3aZuPRR/YK7JG1aiSFM/wJOiNqrKamFdtG1DYx/T7GPf19+TDSbCsacnmoFi7uNuV/jeNE4nXZKYlcJ/e78Wqk8ZHtuEMqHAO9ozISy4vivjY3ON3vWxUC/+8Aim20UDUFHklU4YkJORfRzJDMx5uKFiQMo356oxLvFMztN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU2UFLIb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU2UFLIb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e65b29f703so27036285ad.3
        for <linux-m68k@vger.kernel.org>; Wed, 17 Apr 2024 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713341300; x=1713946100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUqINTkIk1lCvf2JbDxEQx5IO207yYSoA8s0WLqfs0I=;
        b=PU2UFLIb6INJXraNk38jmClK1IamgVsvvR36E+eCPBfcUKCpS91LRUNrG0HTaid+9t
         9z4dIiUYB0fu3qPEL29+/912BX3VLkeTy5thHUfAuLOivPtmPWRYg0/Y80eztL800mK/
         UD2bumxJceNLQGAodxw//9L25oSIXXT4W/aVaP9RV4WZLL4GHoNgUnT0CEnBxduXjBuc
         X43YbFtXED4i6bZmDE5GCAqyLVXXpl0yZWSGKzbTIV5W90Z2P5DYJ584ZpFYJD/VSotx
         P3T/63T5t/bH6WRBSNYXP+W2fg5sP5Pr03f3qStLLVjvydueh3z23TMTuxb8DtCmN9X7
         CCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713341300; x=1713946100;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QUqINTkIk1lCvf2JbDxEQx5IO207yYSoA8s0WLqfs0I=;
        b=TyyAAVaTvuxhg9U7Ui2svyJqZkWTVx53xQXlMjLy0v4o4LBhnR4m5Sgk9Ig8vldZes
         hCNfEH81Kp32X2maMvHBs0urAwHb5VWJhF7kWa1ALqNhW8se3GXYrRtukn2QKtAarqY1
         EoixFGzDcjYseoEfW9piH/6uuL1shXI/0FI9oMxu1Y59c5ljHgJ8ax9ZE74xiIOSHi5w
         EPjVsGcw5p/hCfpm+bIXy4/33zK4SMDkaejVruY1SeyXbsSH6143a8NtsiF2mRKelogs
         tr4E2Dgm2aYu3uNSvU1g59pSkjo6GAWOlCqva2RZe8j6YpwQQ3x2qQH/tp4qqa9kDM/m
         eO4A==
X-Gm-Message-State: AOJu0YxYjnAMeECEyMPQqn4fu6zLG+BsI2y7g278eUffFcRat7VihiNY
	sp8FOO1/lHTYQ5Akg6hqZBFi9G2PVHPBuPHvT7Pk7jYz60vVP9OW2X/2NA==
X-Google-Smtp-Source: AGHT+IE86NKub3uEK64HaD0Bx4vpd4ZnSc1BbJDiz6U1f1qGARmJHWS7jckZ3PpKGMQDeN5ugYfSYQ==
X-Received: by 2002:a17:902:c944:b0:1dd:81a3:8dc3 with SMTP id i4-20020a170902c94400b001dd81a38dc3mr18804315pla.46.1713341299940;
        Wed, 17 Apr 2024 01:08:19 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902ab8700b001e4ea358407sm10974336plr.46.2024.04.17.01.08.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2024 01:08:19 -0700 (PDT)
Subject: Re: [PATCH RFC] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240416203643.3390-1-schmitzmic@gmail.com>
 <CAMuHMdV-ggmMVera8Ya4fDLCJzDXguKCOpg2i_+g98ZvAoctHA@mail.gmail.com>
Cc: linux-m68k@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <e7670276-24e8-dc5e-5387-2ec4f3edd8e0@gmail.com>
Date: Wed, 17 Apr 2024 20:08:14 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV-ggmMVera8Ya4fDLCJzDXguKCOpg2i_+g98ZvAoctHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

Am 17.04.2024 um 18:59 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Tue, Apr 16, 2024 at 10:36 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> I have tested this fault scenario with a transfer beginning
>> at a single byte at the end of a mapped page only, which IMO
>> does violate m68k alignment rules. I cannot remember ever
>> seeing such faults reported from conforming software before.
>
> 68020+ does support unaligned data accesses, so IMHO such transfers
> are valid.  For compatibility with 68000/68008/68010/68012, data is
> recommended to be 2-byte aligned.
> Instructions must always be aligned to 2 bytes, though.

Thanks - won't test this with two bytes offset from the page end then.

Unaligned access allowed means this is a valid fault scenario and Finn's 
fix is necessary...

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
