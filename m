Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7530422EF5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 May 2024 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716314174; cv=none; b=AkJamKdAwvuLfvxxqYgpXIZrNBDrLlfmqp0kzyzbrJdhHGwzhoW5apRlC95bCgFlsQyAtLtr16MMsBgqks0DJEjTBiVKU2HmFqGZZuGy67BkXyGLqXT8NwQBC2oJXL/ZoaIsgdJCM88pTf1mmtf8oPR68r6NvwdxHuXKlr+nLkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716314174; c=relaxed/simple;
	bh=XxPhAG/yUX/Nm9mPnElOYLCHns35AbOgFuFWGxjfiec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCiWIVV8N8UmR3C49uoGHQiGOCHdc09KuQvRS9Zy5ZRtS7EGwEYO4Gw7ADNvP62zqwlByVnpsGBaq5Lms7PCowP405Bt8ARofOZ3ihE5b30G7vYkG0UzcRKF4OehONrRGHQmVs7wFdTTNd7BD9MHUCHxJxRNG9mHJTTJbiSxubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfKKECQJ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfKKECQJ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f57713684so7077625e87.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 May 2024 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716314170; x=1716918970; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDsYH6HyF+sWoSVFGtSmBJpMKqFo1LKGRA9gKjomjMw=;
        b=WfKKECQJQwnPPLPW022AqlrjsmM8sdr84KxIXWVgs8a2o/Z+XlAIo8MRML/CBFyTfT
         k4COp86A3FfqU8fB8Z49j+lVbrf8I21iMl5UrnqZd/oVIuiwfMFt9EB4gmF663dG/cBq
         NJtFDwbelqUsGrPQFWmUTfUYjIIlG/CW08GWFmpk3vNHQnKPS3TZw7gjSAsM8owTAe/a
         TO1dgH3cAbampcHOzQEwXUehbauJ5uAnWSPVlBwHHac23O9IDrw//hhwducJ1lOXrxka
         gZIviKHVZul64suG89MjtZKurkk3ha+CgyhZmVn1Mevh0eeeBPtWfAgbHHsuVhYL/9M9
         VVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716314170; x=1716918970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDsYH6HyF+sWoSVFGtSmBJpMKqFo1LKGRA9gKjomjMw=;
        b=rO5sU6swth5keyfDDt0FPM9CI54pOl7TwgdPFfATegjDLFq+VC2SexxIH8b89eX6CD
         vt5f6Ml6BNaXR0kR36Et9WjC5WjoVo/GLOYJeQW2xfeV5KswONJnrjGzdCYczlkCiWlH
         NdCHuEo5PFCdTZKkNIOyDf52XGdjW8QOAglazfhm7TbtnaGknhIAmQkq0OKyrfb9YL7V
         zOs6ODdWo/HPFHXCoeGm2P8/Xy2IvLG4YuUJ5WcuZEIFYq7nIfz+hCRI8KKeEa6M9KZR
         0R04xKEz6N7nXaAtGxFN6Hju/ejLjh7W3Wh64w11VjkkCzj5Knf683ozZvZNunuGa2KN
         fExA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0ZTbOKgaZC1zyg9RJG491xmNtnKZTamwyXdZW5lXnThCwno0wSR/0puKJBmIGaf0Y78HLedFn0uHLDUPqPEhRcZsTh54AH0Nen22jdwg
X-Gm-Message-State: AOJu0YxFq5RG5zsKsh9C6ao5f1fpvXadkFqa/Lmw8vwecq4/EkJgmC73
	cGzqTAmjNQl5cdO7vHAMadeqL/2NaqF76Ci5QMB9gax45ReBbqGX
X-Google-Smtp-Source: AGHT+IHhmYkBBu8dH6iINCXts2Ok4GpuOMIC1HUc/Pw8wHYrhbrn+/h3P2um5SK2dHIV9F9PV6jJuQ==
X-Received: by 2002:ac2:41d3:0:b0:51c:fd0a:7e34 with SMTP id 2adb3069b0e04-5220fb72d61mr18620991e87.22.1716314170098;
        Tue, 21 May 2024 10:56:10 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:29ba:62b8:5a03:da92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733becfde7sm16940089a12.48.2024.05.21.10.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:56:09 -0700 (PDT)
Date: Tue, 21 May 2024 19:56:08 +0200
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>,
	Paolo Pisati <p.pisati@gmail.com>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>, warp@cs-lab.eu
Subject: Re: Amiga, serial and SYSRQ
Message-ID: <ZkzgOAq4Wn8kw67z@amaterasu.local>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
 <ZkuFrTQDw6iM9Z7K@amaterasu.local>
 <3f1fc752-52c1-4b00-aaef-b917be083718@gmail.com>
 <CAMuHMdXAovcF8rhAeWjDVqQsnQPzMaBmNrQ+bQHe=35hcznTEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXAovcF8rhAeWjDVqQsnQPzMaBmNrQ+bQHe=35hcznTEA@mail.gmail.com>

On Tue, May 21, 2024 at 09:07:33AM +0200, Geert Uytterhoeven wrote:
>
> I guess the system would boot if you hack arch/m68k/amiga/amiints.c
> to never enable IRQ_AMIGA_PORTS in amiga_custom.intena, but then you
> would also lose the ability to use e.g. the builtin A1200 IDE.

You probably meant arch/m68k/amiga/cia.c since:

diff --git a/arch/m68k/amiga/cia.c b/arch/m68k/amiga/cia.c
index b9aee983e6f4..89dc2e8a2965 100644
--- a/arch/m68k/amiga/cia.c
+++ b/arch/m68k/amiga/cia.c
@@ -150,6 +150,7 @@ static void auto_irq_enable(struct irq_data *data)
 {
        switch (data->irq) {
        case IRQ_AUTO_2:
+               break;
                amiga_custom.intena = IF_SETCLR | IF_PORTS;
                break;
        case IRQ_AUTO_6:

made my system finally boot:

https://dpaste.org/ZnYP5

It's definitely $something of the Warp1260 board triggering that interrupt, and we
need a way to disable it.
 
> Reverse-engineering the AmigaOS interrupt handlers for the board may
> also help.

I hope the board manufacturer is willing to help us out here (added them in cc:) - but
just in case, i read a bit about Amiga interrupts today, and it appears
i'll have to disassemble the handler starting from $6c($VBR).
-- 
bye,
p.
