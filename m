Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58E2749C3
	for <linux-m68k@lists.linux-m68k.org>; Wed, 14 May 2025 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222877; cv=none; b=lqT06qC4IIvwagcBRG2iYRDrDC6KFMlXx9YNMDNpypAf7sH1WkRTZZBUIBD29jkMAtIW88zTNefKzOtOckSPXwJk6HvWvWe+oe8uDqJ6MZqx9R/8gOmf+SFVZyM1qUJjIXu+jTKHhMCUxvyxh1XPhXxjPw+Bh8Jcec++Z1accC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222877; c=relaxed/simple;
	bh=AvMS1QZuWH8nM9oPd+mGGzHreipLq8tB7qOea+edNvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uByoi2k1iKIAYsmPkbM+hPacytK/Z1J/NRG0R0BRMkAoqocTqQvKKGpXmX/96CndwFuZQUZWijdPYrIPbaK0yIY0hP1rt1MbvDz9ZMDspCdbX2gMHBUy6ZYuT3kBi7X8Lfq3+MCiHQMTgPSClttWDRev8qggBFc78hg9tBAhD5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCYT2NKH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCYT2NKH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so77003925e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 May 2025 04:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747222874; x=1747827674; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=et8U1o84ecbh6m4FOLOfviKzf2/yLZIseHIwaaEPlVY=;
        b=HCYT2NKHXcdBxFMa/9oyq5DibFlcegwhGSXz4dO0rUHz1zLgKSGyFTKc89BrIom/Zg
         vIbfPHviHDY69dEfevZFSlkoh9g9LHLvBOBM1HlJ+v/25SqhxyXjjlKD+4HywZ4twdFX
         7tnuPuleZRkNykMrw7Swir3YxN6TnVqVeL3erbWleoEYAb8oSRkoeJHM5tlRWJmZwhPo
         /4/1HZpJoQ5imiOJzdTRR6OuzTedAJNdEpXLQ7KYHGVAM8UZmR7cm5RrWgHiUAWxVnPU
         8dFrx3aKczadQYWPV75r8Hy/PScAOnHIYG0y4Ugb5CEG00cVFZJujnKDaLIrLKEbfosg
         Sl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222874; x=1747827674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et8U1o84ecbh6m4FOLOfviKzf2/yLZIseHIwaaEPlVY=;
        b=au+Dif57KxDAnGI0MAcHYUXHhmaRNaop+MaJszIv2RYE0kezW0n3ib7CXSBsGOVPHP
         KE+noPw323/DiMxbtIudRruyCxl7XRua0JQYJMj014EgiHFcWMP6cIz9xjcs7bXDBryE
         ApDtSQcih4z69S7g376GykKzHruLk3o2gFbdJicsqiEOfnwf32hbiAFGen9UEUooFU36
         ykITYcaXI+Tc3BAqxZnTy4XvPr34inkN2HVcRAqIOS7B0n7KY/iyzjsKvKjAp0h+jUOQ
         5HGpBxTnQMQP7I/iDfziSt+8a19IDJ1W32Neovh7+9syE8iZ8JvrA9v1bGYYZIIsrzGC
         OrKw==
X-Forwarded-Encrypted: i=1; AJvYcCXe7V3Hq4lsYFMfslWXF4HjLT7ky1s6CWzNubdfoJyBli0YkwznPpb3uZ873Y8ik/2gxahgNi1kW4Ip@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyHiMESlmgeBNIl5yrMJlDhCFzjDfiMRIJOdmgHi1S8jB92j3tV
	xZe0Js/Nec9cNMVPzqJ4THztWnTYskm+zTIgLv/CNZjrlzB8dXT7
X-Gm-Gg: ASbGncuqN+uQ61+mrV/BprQoxTCk8+hsnIE9SDWzcVsPUxCjsW5KiYn9Lrsrwb1bWiG
	OZKw+yHQ9pff3KMqICYMg7wpKbJrHrneSd4DEANpAqJvlEf635ZL40Rbf/e6cjPGom4Jaq5c3HI
	PwfQJ/amoge47pZkXg27QP2y04FzHncf69MdAgDlVikaZnqPn8qqCBlKZrPRYxwJmNlwefhFrUP
	E6th88Fhf3fdprpXherbAe/FRrhJNIOsiY76Zmr1/NqU+K19Nww3KEl4Ky701Er/Sm7+Ke/cpuO
	dSEsPuz/gLdM9ukojSonmCijBVWNvW3+IRBpOHTNa0ektmA=
X-Google-Smtp-Source: AGHT+IGVtf89pkxJBQnHkIvMa5c5+fKBhgVKo/JJ9GqR/nbttBuKODGJ8fajL/+CqsHVRYTyZbU+tg==
X-Received: by 2002:a05:600c:3b02:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-442f20bae1emr25599145e9.7.1747222873501;
        Wed, 14 May 2025 04:41:13 -0700 (PDT)
Received: from gmail.com ([213.157.19.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f397926asm26770195e9.36.2025.05.14.04.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:41:12 -0700 (PDT)
Date: Wed, 14 May 2025 13:41:11 +0200
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v4 0/2] m68k: pata_cswarp: Add Amiga cslab ata support
Message-ID: <aCSBV_L-NcNX4n7G@akinoame>
References: <20250325155613.352680-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325155613.352680-1-p.pisati@gmail.com>

On Tue, Mar 25, 2025 at 04:56:11PM +0100, Paolo Pisati wrote:
> Here is a driver (and the subsequent defconfig change) for the pata/CF socket in
> the CS-Lab Warp series of Amiga boards.
> 
> Changes in v4:
>  - refactor pata_cswarp_data_xfer()
>  - ioremap WARP_OFFSET_ATA region
> 
> Changes in v3:
>  - suppress a comment
>  - properly return ata_host_activate() error code
> 
> Change in v2:
>  - fix style, remove duplicate swap macro, driver version, etc
>  - rework the zorro attach mechanism
>  - remove the unnecessary zorro ids refactor
 
Gentle ping about this one: can i get an ACK or a NACK?

Thanks.
-- 
bye,
p.
