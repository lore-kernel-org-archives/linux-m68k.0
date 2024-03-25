Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9049681AB0
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Mar 2024 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405922; cv=none; b=PBWA5ZWim9UdF5o9i+turMAC/Tg5r2ZY9e3GXOw8esZbFLV26b3PkGEnOBhflEk1IvL64ONWmmoOXQj/VGGZChioyTkzk8GoFOBzBYKrvpvSgjHyIFPTw9Jj/tAbahUecVgSQDqrk5R0PQwjRtP7Ojmm9HrD/dcrbGpujRpqbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405922; c=relaxed/simple;
	bh=aWjRdg24pcOSVZrqYJz/fjg4RB8A1O9Dw67G1uUXCqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEcGG4tj43Djl89xVOSc6eO21kppSL8EIN9vgh1cuv96HrjAKOqIreaDk16FVljOy/4VChZTHKlH1C+Z8MQLxomFW1Y2Dcz1ei9CaJsWkZj/DA9zjktmdElzZtfjY2tnapUA1wEleQGOZ2ghsf8QyEFBjuepumcwfCmstpP3awc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdUi7o7q; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdUi7o7q"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1def89f0cfdso42958355ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Mar 2024 15:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711405920; x=1712010720; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gkIIlN1o5cBNxBmfcnS5Ee8Bf2m4F3+meqIqvmd6d8c=;
        b=RdUi7o7qeNeXAa6czrhROCnzTNPx6a9HQnhqVfDEmfpf3+r+RJJbW507A4V08QQc4q
         M86nIkjainMMOV+ORvyNubqgPzTfwRwB73zJymYLwA48RBv4G4BoiR4n2SYuFzZ/LwLI
         bzLr9vHnlENUYUc/aC/sAXMIJBbRPMhzlXg2by6+5A/Vo8/vxMCGfdaetCj2dWQKUID7
         Lv1rAZNixovNnIHlI65otNFCgUOaG/JArCu/uQ3mtLK+ayceUYhBp8PC22igZ6eYcuHO
         dkZmxJ+AO1vxEYkY3pisdokkm8+6gAHuXwYfdbiwGXy+aPiwAIZxSwLL8jOR9Z5zb1Ik
         NPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711405920; x=1712010720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gkIIlN1o5cBNxBmfcnS5Ee8Bf2m4F3+meqIqvmd6d8c=;
        b=jaO35yHHFABf/Sd3snq5rlWtbjXfhZjggli2u0xBgh/UWhE273Zx9e5vUVWBDrTz7k
         6XhGE5oVddSi2b0YivvnmSnGfeoE7yeIsHYTZMRXtzOFNdKwrdOiGzCGT/OOIE4rEaJA
         P9MpH+fhf8FryVyT52vh4dhmduZDlS6ueXilgPOoClI1sw4e00LJvU0J4syrXqkjGNn7
         M8YyZe2OE1/GRUtOuduPhQGRorwilxRTbvfo3Fp/7ba8ugxu+vrTTllf1r3FRh8lNrPT
         1W8Bdz+dmo/vFAzSJ6zfB13Vn1/qaY2pqI0iMkovGSQpdhNxHiiezNdnsEylgty2ldWu
         wZUA==
X-Forwarded-Encrypted: i=1; AJvYcCW4qWPZwbnwxMUb5bmB+FTyx9ZtGwhQKoYi7HmT4iQxF7ULM7KtUbQWlCfMNGP4kueyRd7V5uY087vxPkWT1ICusNiDgE1rJ4CScy551L/f
X-Gm-Message-State: AOJu0YyGX1el+QMvjhOvYFHHmfljwPjc4VDdQwuVzq7FyLz7Gmw6TcWg
	06tvfnCc75EwUMlVYJ4c21uO/g7ec6kPlVu6Amg5XTJ9SGpzebvx
X-Google-Smtp-Source: AGHT+IHGH8tvbhxOKUajY2WRDyTQheJFx0IWjzh2lmHlMivQfX2/Gw8cjrUsc313WQ/wxjtZuyvzxQ==
X-Received: by 2002:a17:902:6542:b0:1dc:b64:13cd with SMTP id d2-20020a170902654200b001dc0b6413cdmr8466030pln.27.1711405919754;
        Mon, 25 Mar 2024 15:31:59 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id jj14-20020a170903048e00b001ddc83fda95sm5216230plb.186.2024.03.25.15.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 15:31:59 -0700 (PDT)
Message-ID: <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
Date: Tue, 26 Mar 2024 11:31:57 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <20240322014805.30606-1-schmitzmic@gmail.com>
 <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com>
 <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
 <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
 <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

see below (hopefully not whitespace-damaged).

The set_fc warning is specific to 040 but the bad kernel buserror (null 
pointer) causing it isn't. But testing on 030 would be a good idea if 
you have one with enough RAM. Haven't tried to boot my Falcon with a 
preempt enabled kernel yet.

Cheers,

     Michael


diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 4d4d390a2df2..96cdcacb94ea 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -15,6 +15,7 @@
  #include <linux/mm.h>
  #include <linux/swap.h>
  #include <linux/kernel.h>
+#include <linux/preempt.h>
  #include <linux/string.h>
  #include <linux/types.h>
  #include <linux/init.h>
@@ -195,6 +196,8 @@ int free_pointer_table(void *table, int type)
         unsigned long page = ptable & PAGE_MASK;
         unsigned int mask = 1U << ((ptable - page)/ptable_size(type));

+       preempt_disable();
+
         dp = PD_PTABLE(page);
         if (PD_MARKBITS (dp) & mask) {
                 pr_err("saved from last preempt: nr %x sr %lx %x pc %lx 
sp %lx\n",
@@ -213,6 +216,7 @@ int free_pointer_table(void *table, int type)
                 if (type == TABLE_PTE)
                         pagetable_pte_dtor(virt_to_ptdesc((void *)page));
                 free_page (page);
+               sched_preempt_enable_no_resched();
                 return 1;
         } else if (ptable_list[type].next != dp) {
                 /*
@@ -221,6 +225,7 @@ int free_pointer_table(void *table, int type)
                  */
                 list_move(dp, &ptable_list[type]);
         }
+       sched_preempt_enable_no_resched();
         return 0;
  }


On 26/03/24 11:28, Finn Thain wrote:
> On Mon, 25 Mar 2024, Michael Schmitz wrote:
>
>> Unfortunately, when I add preempt_disable()/
>> sched_preempt_enable_noresched() in free_pointer_table(), I don't get
>> that particular panic() anymore,
> I'd like to try that patch. Would you send it please?
>
>> but the bad kernel buserror with the warning from set_fc() that you
>> reported...
> I think those set_fc() calls are confined to 68040 fault handling. Maybe
> we should try running stress tests on a 68030?
