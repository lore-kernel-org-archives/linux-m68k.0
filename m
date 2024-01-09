Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EDC39AC0
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Jan 2024 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Yd0prTOv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d9b51093a0so2516446b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Jan 2024 06:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1704809404; x=1705414204; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pq/dGBHry+bUFK42zIvRKqg915RDTOWS/nNkiEQIoSY=;
        b=Yd0prTOv2cu14fUYbmbwyDFp5V0Fg3gXr/a4/DlRV+D0ZaY1xTKP+gT1q6zTRE/Dzl
         vPCXzkjyDx1aVmfLdDcIDqHzuPyqvKHKF4TQKh5pyhsCPRAhMasBNzax6FSu4iQP4xLK
         o3vhfsKCX4jHcKODOP4xnXk0xbXs6yeQ80+rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704809404; x=1705414204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq/dGBHry+bUFK42zIvRKqg915RDTOWS/nNkiEQIoSY=;
        b=xSS22deLR6QInuW5OW/0cdqnN/fNrAlkd187z2Gjenr15r20mLq6GLl8mWUWMKHd4a
         V8+jaE5dLIYAvKKfCMRFsT6nOl9dBN2rYFSHfd8hOFftV9E86GaOMo7KqdP1NpGKBcAJ
         8t5UnCMESpEaB/C74pGqOg82oJtqvhYu5bsrSEcIT+e1cQ7yIOTjA1duLiZI/syNob/7
         xRyUmqSc0ogz2kvau0mQOhq67rPkijfkF5bUzAWZxMPXfaEVpN66Yjpip+Tvkd9ONsrf
         weYS1rEkxuzQ1kx2xWC/paZUiv3L64pZZngklVp0MHGqZKWYjH7pqBId5xPoJjQ4/g5n
         dbfA==
X-Gm-Message-State: AOJu0Yy5nV9/enaSOQ6euPMcMWLlf6YVQPNVmas1x94sVxJEG/ifrkLW
	T6jIlTozIuqWKxX8dKFt9XeZa3F2X/8oMPOPhojuQKKu+FjMTg==
X-Google-Smtp-Source: AGHT+IGybin4X6fPS7n0pGkPXVq/l7a2ywRmpT2HL/MuiV7RD2yWxQJMYUOqexE68flKre3YDuqEYb0We0t71oH5V7Y=
X-Received: by 2002:aa7:881a:0:b0:6d9:a32b:a27f with SMTP id
 c26-20020aa7881a000000b006d9a32ba27fmr5221136pfo.45.1704809404554; Tue, 09
 Jan 2024 06:10:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108093221.1477020-1-daniel@0x0f.com> <20240108093221.1477020-3-daniel@0x0f.com>
 <CAMuHMdX44A6+BNByuvbCC2gcM5vAipbaGAK7L8Vh8q3tMynBbQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX44A6+BNByuvbCC2gcM5vAipbaGAK7L8Vh8q3tMynBbQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 9 Jan 2024 23:09:53 +0900
Message-ID: <CAFr9PXn9wqbxToGDkSenW3XTCMPinUg1a9fHrUDQVhRKC6s5TA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: Fix interrupt stack frames for 68000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@linux-m68k.org, fthain@linux-m68k.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi All,

Sorry for the spam..

On Mon, 8 Jan 2024 at 18:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> I think it would be better to use the classic m68k stack frame.
> That would pave the way for building a single nommu kernel for
> MC680[012346]0 that runs on e.g. any Amiga.
> MC68000 and Coldfire are incompatible anyway.

While looking at how to do this I realised that the addql #2,%sp in
RESTORE_ALL in entry.h will now break the stack frames for those fancy
68010+ users.
So that needs to be #ifdef'd to make it only compile for 68000. I saw
an error email from the next build stuff so I guess the change has
been queued somewhere? If so I should send a fix..
I'm not sure how to actually make that generic without patching the
code at runtime (remove the 68000 specific bit, reserve enough extra
space to rewrite the code..) but it's a macro so not so simple.

Anyhow, and more importantly, it seems like there is another issue in
68000/entry.S that breaks syscalls (especially vfork). After fixing
that I now have a working nommu 68000 system. I'll send a fix for that
too.

Cheers,

Daniel
