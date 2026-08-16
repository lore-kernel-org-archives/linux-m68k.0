Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5CE18BC3B
	for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 05:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856643; cv=none; b=ql3Wce64hJBlq9lXYS0k55m+FOTXZJAo8PN/+jhjuehgTX6Hl4gNqARfyrNQeizDIKonuRap6Sk8dEJTt1xHow/JTWMic+1lWQoy+WfVfhOJuL+HOhuKOplWRtYd6RQNc1TA8bCuNQYGHWz2+ET9mHfXXLsZ8O57wNw8WM8qwMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856643; c=relaxed/simple;
	bh=/JFqH62p31KSPNQlaB6xj7khgu6niNzrrobsJjq5VCA=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RHjlsLb6pN6/+mjq6yY5RkOmlfSGHLe7/EAqPQYB5LKs/emUaMFwiSNs5a3YXOJHTKOAEAchmXIpTcKeKPymsy1gjAtIIF2R0P6x0UGCm03LBg1TFUkB0VSKgIg6JncRqGjCSPD0Oa/LU0mNmy/6tf9ljKe8JAyV+KWu69kfIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqlXUmVB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqlXUmVB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e507b079dso1437744b3a.0
        for <linux-m68k@vger.kernel.org>; Sat, 15 Aug 2026 22:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786856641; x=1787461441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7g5CP80UiMIRBFga685VLvP4+LJcpzfyF27b/rjUI4E=;
        b=rqlXUmVBldk01g5l4R9UTS5y5P/e9nvN/e36fZo4i102rkODrrYELQoKC64WEJblea
         g1V8/VdIJ5jmuyUC2ORZdfB4k2pbS7uO2pIH47wIiT6Eu2w+tpd3YVuM69tgqueSRtTO
         tI0EENQJTY6npO071Kvtd+KcpNTrSYU14KM9I8wsnubng+75GQr1c6Xp9pc0E92x9t2r
         rN3I91410VVKbXCTebYqCmL819ElU2hgymH4cudIw4k8sImgVnZuCyjQ8pCV75Q0imIB
         zJcObkhmM8msF9G+trYlrQ9/bCZfZFBRtReMqHSOkJj9nA4Zi/PofSTrjXlgfUIfRovt
         C8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786856641; x=1787461441;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7g5CP80UiMIRBFga685VLvP4+LJcpzfyF27b/rjUI4E=;
        b=FfRQxEI8LOJw5Myo78sP3wfgAiz9n29Jtrx3qijOxF6zFhszziCMC8RcAXBnAZYaLV
         9UoloxXYvZId0gmgZwQO8mGDofi28rj+w+EM+CltiKZydn7R6JBiCMj8hn+l5KVs9tRd
         YJtnryv1swkdW6T6+9+FxJsjwcoxVauLlAbpQZAQBjq/t7Ww8fJ4vCWIdeKoJTQOMb2+
         2ppQr96saFm7kV0DaXE8phwwk9utAA3+VqfDMSF633HnHXzAnFX65ND5SVSD8shCC96f
         qia/iLGI/OGdDyPdcOP5srdIbgwy5DUZOJhpDUD+Ani+/pWC7S/Ri/EGB2gonqhfe0N5
         8gfw==
X-Gm-Message-State: AOJu0YwaGs5LmpHwqI7eTyKIJCTIgkF/rMcfF9mpFa0IHsWV2ntYc4IE
	zxPWHn6rwzXFodrKDc3OatbQKHezIJTTdIYS3Al5OoZq4R8egR92nnfH
X-Gm-Gg: AR+sD134ee7Px2tctZJ0fJsuEX3FArz0mW88r9vrCjqaLeZbGmm9g50dJZOqzxidMu4
	raIgJgjNOs0YL0HzOzToUirRuCMK1z90jghm4iRvlTXAT9TbRWGIQTiasmv6YK0YOcVTMUvMyLc
	TdYnVlkv5nuOLXtCxUAKXLjccu7LdIHNgvSRdFdkN6R/oRmDzsPE89j4/QXwgR7uFVwsMWAm7pD
	pVER7W3PJtfmO5OHaItSVu9pw6z42iAnOLb+d+JMGvgdTflilwK3rQLQeBChGW0rKz+852nWLul
	BX6OV/SBva3/3cmmZdtS/gT9oSjTGWEx2G1j7xr483jxqE/Rkej9iKfI+safLs1OxgQwxjCBwBd
	fo3xq/HfEtDXVGhodzMJSYLx7mHC3YzzaBbHfAGcSkAlLG2WdyQUQJWlEW2Fupcj6ws/X7AS9Ar
	dwoZuhrUwBfXm571LLB8oqi8UMjcYAagRe5kACXYEgXzAzLlMaonoQlgiDLfFNXLHWROq9BblIL
	x6lQd64GEU3lWprslCBHCQ3
X-Received: by 2002:a05:6a21:e8c:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3cc71a2518cmr17985995637.11.1786856641308;
        Sat, 15 Aug 2026 22:04:01 -0700 (PDT)
Received: from [10.1.1.24] (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea2f787fsm21192044eec.20.2026.08.15.22.03.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Aug 2026 22:04:00 -0700 (PDT)
Subject: Re: [PATCH 1/5] m68k: Fix atari mouse movement
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260814031745.17140-1-schmitzmic@gmail.com>
 <20260814031745.17140-2-schmitzmic@gmail.com>
 <CAMuHMdUDvsqT5t93-ZO413pwS3rPYPB1_uy+5iRHsii8CYTdgA@mail.gmail.com>
 <ef9e0128-6309-546a-715a-3e7eb476910e@gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>,
 linux-input <linux-input@vger.kernel.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8c7863da-299f-8c77-0727-fb438467a7ba@gmail.com>
Date: Sun, 16 Aug 2026 17:03:54 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ef9e0128-6309-546a-715a-3e7eb476910e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

Am 15.08.2026 um 11:15 schrieb Michael Schmitz:
>>> --- a/drivers/input/mouse/atarimouse.c
>>> +++ b/drivers/input/mouse/atarimouse.c
>>> @@ -70,9 +70,12 @@ static void atamouse_interrupt(char *buf)
>>
>> Alternative, you could change/restore the function's signature to take a
>> "signed char *".
>
> Agreed, but without a way to test this, I'd rather wait for Miro
> confirming that change also fixed the issue.

Still untested, but even though not 100% identical, this change 
(whitespace-damaged) produces functionally equivalent code:

diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
index 49a9a459bdf4..6e150f816c02 100644
--- a/arch/m68k/atari/atakeyb.c
+++ b/arch/m68k/atari/atakeyb.c
@@ -39,7 +39,7 @@ void (*atari_MIDI_interrupt_hook) (void);
  /* Hook for keyboard inputdev  driver */
  void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
  /* Hook for mouse inputdev  driver */
-void (*atari_input_mouse_interrupt_hook) (char *);
+void (*atari_input_mouse_interrupt_hook) (signed char *);
  EXPORT_SYMBOL(atari_input_keyboard_interrupt_hook);
  EXPORT_SYMBOL(atari_input_mouse_interrupt_hook);

diff --git a/arch/m68k/include/asm/atarikb.h 
b/arch/m68k/include/asm/atarikb.h
index 68f3622bf591..b2d9e7676324 100644
--- a/arch/m68k/include/asm/atarikb.h
+++ b/arch/m68k/include/asm/atarikb.h
@@ -37,7 +37,7 @@ extern void (*atari_MIDI_interrupt_hook) (void);
  /* Hook for keyboard inputdev  driver */
  extern void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
  /* Hook for mouse inputdev  driver */
-extern void (*atari_input_mouse_interrupt_hook) (char *);
+extern void (*atari_input_mouse_interrupt_hook) (signed char *);

  int atari_keyb_init(void);

diff --git a/drivers/input/mouse/atarimouse.c 
b/drivers/input/mouse/atarimouse.c
index 351aab69e905..e2801be8f371 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -60,7 +60,7 @@ extern int atari_mouse_buttons;

  static struct input_dev *atamouse_dev;

-static void atamouse_interrupt(char *buf)
+static void atamouse_interrupt(signed char *buf)
  {
         int buttons, dx, dy;

(no cast used in the Atari ikbd interrupt handler though ...).

I'll go with that one then ...

Cheers,

	Michael


> Cheers,
>
>     Michael
>
>>>         atari_mouse_buttons = buttons;
>>>  #endif
>>>
>>> -       /* only relative events get here */
>>> -       dx = buf[1];
>>> -       dy = buf[2];
>>> +       /* only relative events get here; the IKBD sends signed 8-bit
>>> +        * deltas, and the kernel builds with -funsigned-char since 6.2,
>>> +        * so an explicit signed cast is required
>>> +        */
>>> +       dx = (s8)buf[1];
>>> +       dy = (s8)buf[2];
>>>
>>>         input_report_rel(atamouse_dev, REL_X, dx);
>>>         input_report_rel(atamouse_dev, REL_Y, dy);
>>
>> Regardless:
>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
>> geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a
>> hacker. But
>> when I'm talking to journalists I just say "programmer" or something
>> like that.
>>                                 -- Linus Torvalds
>>
