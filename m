Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5FB18EB1
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716238866; cv=none; b=qo6gVY0z0Z2LCWhVreNA5E+aI/Jasnj8WKZANNtsAIbGrGQ1tFZmIPwIES1PwKyWvrjpmVXkKqfIJtITcmNesyRDSuW+ig+ybhSQGwichOXN2G6JKnhi2sFIRoFOQuRmTusmazXheaQfT2PTrJjySNIOn/PZxbQLyiy2gZoTuBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716238866; c=relaxed/simple;
	bh=uZtlalVkEeD6ECs6Z7OBKJN1w4Dzee2GQ1WN9iqsnHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAsjvdXsquyBBByDf4sh2CjHrqnzwqObHrB63bYJ+6B+43r+Y/vjiqCXlcIdMBwb92//h3StDqWnThDvwBCYpAVRDYquPqpqUdxRMi0r5HvhzrX9mZ8PUbMr31nWZ9X7Ve8mlIVm5Dl4/5yIRA3l80upIEqdvxrWWWgTi4U6Ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQQsTzm6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQQsTzm6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f693fb0ab6so589613b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716238865; x=1716843665; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wB2KNI2pDpGmk73upaTDhuvcZgjYPZ7m25ekBEncDco=;
        b=KQQsTzm6SZtcVs0CLrjBgcEOqdqPiT68nkkT4zO1hp4XHEJJ1W9yHdv61u10Nzwb1s
         DUckVCxm5E+B7WdHoX6UhxF+h578PyXc+9VNyAKzdR2S9rpe2EYvV0rPMVOTibT9WZJ7
         mRaJNszEtgtPKeL2g/SLOhT2YjNzLhgutGjEOmHbw9FrdXHQtcCFty1fj2Xz5rfYSrWq
         WmDpoaT+oXFVU/VJaXUDDrRUD664ZKZYdxh0OmMHsIha5iIDOJ38BE7lc8OLXXHmqXoS
         ndB1bwySmXc5kpMML04ik5eAMKQSH1FjhFgQLqV/PFzJB4F+NMjxZ1qNDgV3Bi2q4RBv
         CNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716238865; x=1716843665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wB2KNI2pDpGmk73upaTDhuvcZgjYPZ7m25ekBEncDco=;
        b=GTaB/58sJ8jq9A8tTK+zFoukr1pISykth57LiS5kjCzyS3Vw0KY6uBJKjTxSWPFdAs
         voXS+8C0Cy+yEsULdlpHbnNi9ZvEHMSapM2l3kT1rHXpzVGKx92GA1lVqBsJLVKx8xog
         PRynMbkxYJfwfHL1epprAvYaoempr3/TS758hFzT55j8+A5u8oIE+2ljL8Up4nNAeMvm
         dpSOezG5nZKw49scE4AhJPhvRySw4HUSTutY2hspG5k4vPVgyC6fYuNDJcGYGN+l8xsL
         LX7A30FcKPoqzvkfCXf6ON+o/rgoci4qMYANnhYCeb+GJ37DrNvS9sZySJ7ZeH3i2LwY
         n1hA==
X-Gm-Message-State: AOJu0YyjqCPL/5Rg8HfdTSb4Rdsz1Qcu1axQbamUrafHW63zIP2Fi1nL
	Vojmu+T6uHi04CFpSLDEcTESfC4i/XEoK9FE23lgg3OuPUmNuUkd
X-Google-Smtp-Source: AGHT+IFPOdKyvxz2uZdja5ikQmEN/UUtUtot/RuLYHdvO9VSfeWDTWIO6uU+L2JT873OWgYFIiIjKQ==
X-Received: by 2002:a05:6a00:80c:b0:6ec:e726:b6f5 with SMTP id d2e1a72fcca58-6f4e036b59bmr38210815b3a.26.1716238864523;
        Mon, 20 May 2024 14:01:04 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f6a5ba6f5bsm3860791b3a.190.2024.05.20.14.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 14:01:03 -0700 (PDT)
Message-ID: <3f1fc752-52c1-4b00-aaef-b917be083718@gmail.com>
Date: Tue, 21 May 2024 09:01:06 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Amiga, serial and SYSRQ
To: Paolo Pisati <p.pisati@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
 <ZkuFrTQDw6iM9Z7K@amaterasu.local>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZkuFrTQDw6iM9Z7K@amaterasu.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Paolo,

On 21/05/24 05:17, Paolo Pisati wrote:
> On Sun, May 19, 2024 at 04:58:17PM +0200, Geert Uytterhoeven wrote:
>
>> Probably some of the Warp 1260 on-board hardware has its interrupt line
>> asserted, causing an interrupt storm when Linux enables interrupts.
>> Amiboot knows how to reset several boards to prevent this, but it
>> doesn't support Warp 1260 yet.
>>
>> https://github.com/geertu/m68kboot/blob/master/common/amiga/linuxboot.c#L195
> Doesn't the kernel print out something like "too many spurious interrupts etcetc" in
> this case?
Used to do that, yes. But I haven't found that message in current mainline.
>
> Anyhow, any debug option i could turn on? I've tried everything IRQ related, but

CONFIG_CONSOLE_LOGLEVEL_DEFAULT should be high enough to print messages 
of level WARN:

asmlinkage void handle_badint(struct pt_regs *regs)
{
         atomic_inc(&irq_err_count);
         pr_warn("unexpected interrupt from %u\n", regs->vector);
}

That would help to verify Geert's reading of the problem (which I have 
no doubt is the correct one).

The interrupt vector number will tell us what interrupt level is causing 
the storm (if it's an autovector int).

CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7 is what I have set in my builds.

> that didn't change a bit. I understand it requires a new fw from the board
> manufacturer or a quirk in the bootloader, but i would like to get something more
> verbose before i ping them.

Interrupt level and vector number would help the manufacturer to give us 
the information required to disable the problematic interrupt source.

Cheers,

Michael

