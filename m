Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6AB1A9FB0
	for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Jun 2026 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309128; cv=pass; b=HR/ceo3qMYGT+h2t9VWTSQFUylvakMj2vf/VZxWOo7YOIzT4N6ovZlvHwCi4PHb4LbEbjQKuEkyjtyQdMfulOvGvRPRam+dC45I2sIM6qKGPqXZz0rU1ynkddmi23salLkmHf5my5aZfgKQ1QIQLipPCDSWJdituAv7BMS+c8Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309128; c=relaxed/simple;
	bh=M0HmWkSWd9SoNdLB/1JBTpIcmc5oxevxumChcYu0r14=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEQ1OxJ1z/bVW1vcakW1VlrWj3b/bu+ygt0EaEasVMZbQ6yc0lbaVaE1qCDugeB3erJzTSuVeTx5DU0XmOqqWeKI1c1U3c+80ju1L/vjx8nMpO8t02fLDXmYDrVNml8b3Ml8NiFCLd6bzDyYNgvCNsu6UK14krF86wEx5TcbXuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aJCQxtiS; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aJCQxtiS"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c0c5d170ad4so116564166b.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Jun 2026 06:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309125; cv=none;
        d=google.com; s=arc-20240605;
        b=Mu8ecPetRDxPTfHnpcoi8MUrB2TXSn8y6YmCwHRd0o4SNAAbcid5Q4TK33B+d45lqd
         oWXofdewF/NkqYl7H6W720zf/69CHS89NKiIVz/MiJg/AT8MxekiGr/ltTjEQHXWNLBK
         qOsLUkk3D2x6g2KHG80cU8skRiuWO0zCUdwbKCZPUzQafWvr51aTJKUgY3PGO2zc6TqA
         2XRKyWwHgBGVGXOdUX0e35cdL30MMflJk6DTDThun9W4GtmNXfvu8wneVdHKK0a20EKS
         SG1szL1PFwxmZeWsJ899d11/l4/hygOmtWykp3pHCrHOwgB+zuOelWuN+jm/ttrM6wy6
         +Ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
        fh=Oia4sT7nJvWJgmot5KtAjlomYv5jOnN4+CWz8zfGTqs=;
        b=edMWi9SgAjTUyMAtAo+Y6D/iSfgRH5o8uP5tXB2urD+qSkwZANmFbZ0UnIK/uvbc9i
         rZ2zEWaPTfy5o3exHs4A+NgzBxxeMKq9T47qZS1GN/7ShdTPZEG/HbJZ/vy4GI9j8tIF
         77SvhCj6JIKR9shsNNe/r2PWyNIjLZjbttNYp4Fd2g/p7YuwbeGMef7qW/uy6y5u8O24
         dHlWIEEQ2iLLBv/AIICROtWt6dOsuwN735hprZnCXllHFzVcafphuXz8D6cjdwm6paC+
         HtO4P+7AISTmjc+TlRyKgl/09zXs/NZ/RQFrgOIcRrro77a46JWu/OhG0MrmoH93Pej0
         1HLA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782309125; x=1782913925; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
        b=aJCQxtiSwq8k5BEi0fgiFJPjxZpyKCOuu/3Q0t1K67Uht5W8pk7w+87oCDOrgTW8yg
         eoS8zGQB3IpvB3gUx5MJXtEwFdUjkzelnj7EDVQlFaklNG8JMtA3mvP03CjnzUQLjtnO
         F3DpB0j9erdlmb0lNzfJR1xvB28rrYGUF5yw3WyyL2CmuUu58BFvcC6qaAhbeOF1n5Wv
         jW3t/mQ3s2SNQlw72vefxIRcOu2qSdzoXL9eGzbjytu/f/GlsECvJBk3xgDWETk5gEup
         UER5m2M+oWe3u3nMLgH7l4z+htRdRu8q9N+ovIldcj4sfHZ7CohFmuBiLTg/uVK91jsa
         jGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309125; x=1782913925;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JVKkeSAj9cEIT5s5aHGZfnYhC/Asr1gCUKNdYQVD9Y4=;
        b=MrpvNkghVqJht1XBR6Xk/7tTh+pAozDuXelJQ4mCnW73ozeCXQYfS0SZfIdB5SFkQ5
         esmgYrxQg1e0yKy7F51qhEtI0kqOuHN1A7dJhmPGAqX7VdisF0BibHnCO5omHT3OAK4N
         rf0rhwCf+tWULxm+hFC3w5TCPAYGAF4tv4ULYoBQTfsi9MUHdVXfNoCwCNaYrMiB+XJl
         TGVxWOy9abyH0SsbXtpLkQjF3HGKgya/HfbssmF4i2IyOsdI8pXOpa/MsliCFscHjm7R
         206Q9MXfY3e3Hfu6ZsSoQQr34ombc/6WyI7hPMWnm8Ck2/Fcuo4tItr65Mseq8yPTLI3
         p+PQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Tb3Nt6OmE68IaqnT6TfNwQrWhdwfmPGRnXEKxL03wdLf0Ed4ETgkmjwITQP5CQGUM7Tf/nND7mb5I@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxOk4GVvQnWDEECCooP5jp6n6pOXO7heZkautMLIWv5bkklb34b
	alYRgtJSoPJ2W2m8C1wMY1XmOiTtlkUXZ/lWqOZ7v3wW8IzDNZ1WQU9aC8froUFe9jJtb3YWCHq
	IeClTnZ/np/AjKUA0LKJoP10w3thWwXVRGNVIrZAHvA==
X-Gm-Gg: AfdE7clT1y5u5BATSD8NUjs4JYi2JYvqY7Z2AvyXRbPvBm7s6FFp56YG9JzUZVTuH+0
	2AdiyoaeKr9wAcyPk5DWfYGzeYtel9Y04cTuwmd1ls2bHTcGKR4hE3Bf5GhcPCJ+9MMhbdKWAb2
	vAC+XEAd6JH+7ktaV1GXoingIDBNXiMANJucKmm7di1nV43PpTpdtXAccDVoPNzX9Wy1ZQBpHch
	CHJcNfqsr9SV9lANdmFSeTYVfwhMcPm+P+IV4aW/4m4zs2gPJDTylpzlU9xzPeaUQbSTYgDe8vV
	Z3hGnIqI7KyA9qRucAdAiJTaRg==
X-Received: by 2002:a17:907:60c9:b0:bfe:ed06:5a14 with SMTP id
 a640c23a62f3a-c119f6123b6mr182955966b.50.1782309124805; Wed, 24 Jun 2026
 06:52:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:52:03 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:52:03 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com> <ajr4LvdPZKHrqDVp@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ajr4LvdPZKHrqDVp@ashevche-desk.local>
Date: Wed, 24 Jun 2026 06:52:03 -0700
X-Gm-Features: AVVi8Ce0Oz4uWAyICirL9pSge-M3xWIHMYk0X2M6seIbhH3jA-_W8vl1mqu01X8
Message-ID: <CALSJ-wAFwYC38X0VUYYBX_AYsWChpFxDQtQ52KHhbFV2Bm=prg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] add mcf54415 DAC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,
On Wed, Jun 24, 2026 at 12:18:38AM +0300, Andy Shevchenko wrote:
> On Thu, Jun 18, 2026 at 11:04:14PM +0200, Angelo Dureghello wrote:
> > This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> > builtin DACs.
> >
> > Currently the driver enables the raw write only. Feature as dma, sync, or
> > format are not supoprted for this version.
> >
> > Additional options suppoerted by the DAC module will be added to the driver
> > later on, as needed.
> >
> > The same patchset prepares the m68k/coldfire architecture to support
> > the driver.
> >
> > Below some basic tests done on stmark2 mcf54415-based board, voltage check
> > on DAC0 and DAC1:
> >
> > ~ # cd /sys/bus/iio/devices/iio:device0/
> > /sys/bus/iio/devices/iio:device0 # ls
> > name               out_voltage_scale  uevent
> > out_voltage_raw    subsystem
> > /sys/bus/iio/devices/iio:device0 # cat name
> > mcf54415
> > /sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw
> > /sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw
> > /sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw
> > sh: write error: Invalid argument
> > /sys/bus/iio/devices/iio:device0 # cat out_voltage_raw
> > 2048
> > /sys/bus/iio/devices/iio:device0 #
> >
> > Same behavior for /sys/bus/iio/devices/iio:device1.
> >
> > Generated a sine wave by shell script, sine shape is good.
>
> Heard a presentation (Embedded Recipes IIRC) where one tried sine and real
> sound (it was about sound DAC) was really awful. So, Can you try a bit more
> sophisticated signal?
>

sure can try some sound with this 12-bit, but don't think is possible now
with only raw output. My idea is with further patches, once ColdFire DMA
is fixed, to extend the driver and be able to sample higher frequencies.

> --
> With Best Regards,
> Andy Shevchenko
>
>
Regards,
angelo
