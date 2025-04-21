Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EF184037
	for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Apr 2025 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745267739; cv=none; b=ntzuTyL/jrX8UPQLRjnh7sOv2ND9tJ21rvr66ljesoC4GB8KvepAMK7CXHC87BKenfF6qsRazGjHa1KdHT8E49LZUD7sW36pgBhvcBqmKWf5drc3rH8vnUsR/YIP+bflpGVZKYfD0m1R0FGhs6BUap0YE2R0one3K/b9ykmv/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745267739; c=relaxed/simple;
	bh=T/W9KQS81inxas0xsmVFegBaEcdCxywpWc1GlB8uzqU=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fk/zeFV7NHxB2geLz9QF3r3YUodTeFh0A2GLNgd42JNjqrTywYqvmU1btYnX8fF3uMRhCNpzIiJ1Jz9hT4PCFxJEmoAjw9hDMLCF4zvBgUHkqFFMR1fp3441Hnd81T1xdUHGO27u41fcBbC8QHUZy/wZuJI7MeP66r7jSdUbtn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+fejLOS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+fejLOS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3569602b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Apr 2025 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745267737; x=1745872537; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0oXblymDxIujUQXMC+xQDbXJycOB56NoZ5MoEc/+A8=;
        b=G+fejLOSouR+cmPUkpZ6THm8kzPJhBtL54u9C3ILzWQALWxXaR60ao+92RwrXl9xVZ
         rfPIZOjSnyT0uc6YJ4XEEi7/QcaXLWEqpk2mWa17gHlH6Ud9KmOSyBUrLewmGTgVwSyT
         9Vw2qTZyir5lUx9PxdoOQQzS1gqLANkgVowi2vzS/0Z3Z3N2e8KaAE1azW3IquzjzUU3
         wtXAmvWAqXrYD95UWs0/n4Wf4K1l9IAmaPmtAlJd8QuGLmwohT3McAByzGT/a0yv7Xgk
         xHcOcSHriRA+da+UJ8sMcIaVk+0UGeGshDFf8mpPlfC2inhpNiPRPBdTVuYf6QfkTnEl
         8jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745267737; x=1745872537;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j0oXblymDxIujUQXMC+xQDbXJycOB56NoZ5MoEc/+A8=;
        b=fnizgNdTN9g4WNrCtBfTFA1zu4RALFcmTCYeEPMCYnU9DbrO3PbYp1h3IRV9tBrXHM
         xZhma2nIVdkZqzZx0oV8LXx/sZdxrpfyRs6juR8PIWtBkCsmGBRxw74Dw5XawsRR8iuA
         oQ5zsZUepLWG91Ly/5DpHuhWmEYbGHYzC1ON0L5np+5VqbVWUEojTMJqDQu5rEkHYlKB
         /n1VWxRAdOUdWRzYUExo3ssr71zBAffRERFZci3RxqU+K4e7UOHeDU7LMtQVIyORon6d
         mRJkS3CbTQdsK96tf8Gu5LxcuutLVXA33cr/8wirVKAqSILFykhgXOXb/usuETmFpdw2
         EeNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRyPp+xr4soek3qoaevzNwJ5l6WNR2rMV0oc5mbJl1Amqg7jfMgL4SnevyIHz0UGTYYQBXsr3RrXAz@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy5dFrZphh2z7XWNCm+38T7k0rylGdMb+kU3Lt33rnm0sUltIm0
	15jp8dtuOHdYURZblwp0iR+Hs7vU6GS63eV9z595F5L6EOLyuos7AOKcGA==
X-Gm-Gg: ASbGncvrLqjAng5B5EHodwLxG8ZQSsQHicPgopW5eDqIqnH6y1ebKb3ae9k+bv5lUec
	bjnsskSkFLtDd8XJ6BeV6+/AqzDgbEs6lyd9Ez3jZT2l9OWGcD9L++oJGFI2JnSZcTmKfIcV0VM
	ZMvuInmPNmlsG1OMDMggjIIsfq6jSx0Kbg6yoiVGsfkHaeH3UziRbyD4GNsk43qOaDSKlinHgEv
	HiCtEKHNOgb1fIbBmBVH2IUZqo3ig/8g6xAZ5yB6ylaQ1MqklqSB7OK1oVpx9tk6uB8CYr/Kifs
	LxT9RYvvhEPwj+DrJWmKWSNmvYpldEtVkbGxAKVBwzyAVvk48LntIbC22e8dPvU+t0OohR95Xes
	KTA==
X-Google-Smtp-Source: AGHT+IHrBfZALqt7jEjrxFUFAZ43YB+VIl2zqaQ2rET37hDd40vcJ+vBHOxM09XRPziV8UO7wJr+Rg==
X-Received: by 2002:a05:6a21:1585:b0:1f5:52fe:dcf8 with SMTP id adf61e73a8af0-203cbd3392emr16964164637.26.1745267736674;
        Mon, 21 Apr 2025 13:35:36 -0700 (PDT)
Received: from [10.1.1.24] (222-155-154-210-fibre.sparkbb.co.nz. [222.155.154.210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db157bb7dsm5990280a12.69.2025.04.21.13.35.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Apr 2025 13:35:36 -0700 (PDT)
Subject: Re: [PATCH] m68k: mm: Replace strcpy() with strscpy() in
 hardware_proc_show()
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
References: <20250421122839.363619-1-thorsten.blum@linux.dev>
 <f178cc44-1b97-4e72-94ae-cffa08173a99@yoseli.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1637cf38-da51-eb86-432f-aa6ad9628f2c@gmail.com>
Date: Tue, 22 Apr 2025 08:35:30 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f178cc44-1b97-4e72-94ae-cffa08173a99@yoseli.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Jean-Michel,

Am 22.04.2025 um 01:02 schrieb Jean-Michel Hautbois:

> As we are not using the return value, I think it is a safe replacement.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Would not 'Reviewed-by' be more appropriate here?

Cheers,

	Michael


