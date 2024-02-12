Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3937E9
	for <linux-m68k@vger.kernel.org>; Mon, 12 Feb 2024 00:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707698943; cv=none; b=cI1A1nmxDmCIIS+cu9Df4dvCWqOa6KdjVhnZ3MZg6yKs7euDgnnvOPnZ1o5JQ5OTJe93NrVfj8hrAuVw+qRUEeOipMFYLWtTUN4dDhEJNTVq6VQQr4DhGjng4neZLfClxfh7ToalIdAqoBkpthwH3M6wid1E8k+B6RRjBXIHI4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707698943; c=relaxed/simple;
	bh=0RBsGcHgnbvvz0Xr51hXSEeL6hbWMdt75HlXXA2EX+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fn4WU8irUcY7cZKpKIv+8GpLnp5cgeRwHtoS2nV47F9QF5r1Qwv1RmetgRtT3c09gR2gSWzDQG5g1qwvLIsViBcqOkREHViNSZKx3A27qJftH+KbWRZ2bQqMZvpaNEmBP2yQXSrYjTNoYZ28tgNz/Ir6vR13gNY8AWjJAmqXfFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXNczt7R; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXNczt7R"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so1796838a12.0
        for <linux-m68k@vger.kernel.org>; Sun, 11 Feb 2024 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707698941; x=1708303741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CIgNWWoE1k8isP4ouJdbhuUmYX7ZaIQXrsFa38XH8Q0=;
        b=eXNczt7RTffdnp+b4Rx8lVBJNTrQITc4QFrK1nN1Rao9tgCKUsfLLlpCCbl/dtWsYx
         ZGEQcy3GgekWMVQ49W6AphpJx6VnhMmovtQmBnilu70ZQqtQG4cX5Vi2g+FzUO6L8tZx
         BlbcuADnPL2DBWx9mviBmz487tlRFoKfE9YC8UzRDL/WZ6OaMoj589L8bLkmVWF/hLaV
         yjwrIhCahZ7mxpvQ3NqGlT7QKKnaDTsNfUv9LWfQd/Gb3k37BW6idJijofNeomOr4trt
         MynUe1AOm+xu3tPtI/clqSn8ACBnCJuTTps1Sk2gak/Cf+r8s36T7A1Khf8STLep+bBr
         GGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707698941; x=1708303741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIgNWWoE1k8isP4ouJdbhuUmYX7ZaIQXrsFa38XH8Q0=;
        b=XIQkxHuZoZ9L4ylX6PHXZuxy0IVLirVgjFIW/pHDSGVjwpU44NVV70uMRKaw5f+/dg
         rkp2vZz3Unq+HjFlQT6hBF6tDzGDIhsBQoCT/wE2qPPuu8gq1D4aecrKfs6ooAJ4U+nr
         ca5fS0qMsuvMi9VRTB2CZ/s9TQx+FUIKrsj76APunNiY6RHDSNncTdTvV27Xu2KQK88Z
         xqtew5Wk2+RqA1NXk+8No9mNQFlPlAJ3bBtnqnEMuFiqm7PYRRpZEDlSMYQ6GOAlQp0+
         D4p+BNmRjHv/lOwHlf6E0kQrlhr+qkAIR1DVax9TGjMUAgGaEX+e6AzC7IwEZYEYRW7C
         eGoA==
X-Forwarded-Encrypted: i=1; AJvYcCURNCHZty7Ji15HOeXMD7fFFpZQVx25xgS4gTr84za876MbrhAn4NWANCwLdf/6dBnKQZae8uW9m7iqlCRnfH8ATz3IrBvHsvmsLg==
X-Gm-Message-State: AOJu0Yz174JMoctvNTX7t8qbCb2bdZxZttKsNaBZcIZcociZsNcFOFrL
	AnSiFMFk+wQXilZW4jgdKhfA+ZtUs/+h2QwFIBrAOcN3ZoJA/5+p
X-Google-Smtp-Source: AGHT+IFnAxwgLFY/hv+JUvF1VxpmZdwB8TqurSV3L3y+K36Grnw29CK+omKtvS5u8rgrxr6mYY39Pw==
X-Received: by 2002:a05:6a21:1743:b0:19e:ca05:226e with SMTP id nw3-20020a056a21174300b0019eca05226emr2338087pzb.9.1707698941115;
        Sun, 11 Feb 2024 16:49:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVE4+8Hn0AjFUs1xSR5SqA9XPFw486D2CiF5tSTIHGcyMlCsR2VNxpvV+vu/36dE+vAbubRpw1r2faZsYs3moc8jbjb2btaKE0I+jSnJyL0MCeZ7vEHe8eaDDUZvUJ5uwkgJQDep95ItaChD/qvOeOF/w==
Received: from ?IPV6:2001:df0:0:200c:adb8:c71:a09c:347f? ([2001:df0:0:200c:adb8:c71:a09c:347f])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902e90500b001d9ef367c85sm4777987pld.104.2024.02.11.16.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 16:49:00 -0800 (PST)
Message-ID: <142a53d7-3a29-4609-b3b7-07f7f00ca64f@gmail.com>
Date: Mon, 12 Feb 2024 13:48:56 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/8] m68k: Handle arrivals of multiple signals
 correctly
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>, Ulrich Hecht <uli@fpond.eu>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org
References: <20240205023236.9325-1-schmitzmic@gmail.com>
 <20240205023236.9325-5-schmitzmic@gmail.com>
 <CAMuHMdUMwQSEwDQ3tsmChutY3P0VQUA0A8jg63NxfyrmxfKWXQ@mail.gmail.com>
 <401b6911-e6ed-3e9f-9dcc-d4f951c6beef@gmail.com>
 <1501038841.1120470.1707393238298@webmail.strato.com>
 <34d37f57-3146-8aa0-7828-2df2d1679ee4@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <34d37f57-3146-8aa0-7828-2df2d1679ee4@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/02/24 11:51, Finn Thain wrote:
> On Thu, 8 Feb 2024, Ulrich Hecht wrote:
>
>>> On 02/05/2024 11:15 AM CET Michael Schmitz <schmitzmic@gmail.com>
>>> wrote: On that note - Uli: would you prefer the entire backport
>>> series, or only those you do not already have?
>> I'd prefer to only get what's missing.
>>
> Ulrich, I imagine that you would normally receive fixes via the
> corresponding -stable trees. If Michael's series went into
> stable/linux-4.19.y you could cherry-pick from there for your v4.4.y tree
> and maybe avoid some merge conflicts that way. So perhaps we should ask
> the -stable maintainers to backport first (?)
>
> Al, I see that the following commits are missing from stable/linux-v6.1
> and older trees, despite the word "fix" in the subject. Reading the merge
> commit 1a8d05a726dc "Merge tag 'pull-fixes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs" suggests to me
> that these are old bugs...

Only

bd75497a77cc m68k: fix livelock in uaccess, and

0d20abde987b m68k: Leave stack mangling to asm wrapper of sigreturn()

need changes to apply to v4.19. Only compile tested so far.

Happy to submit the adjusted patches to stable, and ask the stable 
maintainers to pick up the missing bits from Linus' or Geert's tree.

Would that be good enough?

Cheers,

Michael

>
> bd75497a77cc m68k: fix livelock in uaccess
> d835eb3a57de riscv: fix livelock in uaccess
> 0b92ed09cb9f hexagon: fix livelock in uaccess
> 15261678a8c2 parisc: fix livelock in uaccess
> dce45493aff3 alpha: fix livelock in uaccess
> 79c54c97c773 sparc: fix livelock in uaccess
> d088af1e221c ia64: fix livelock in uaccess
> a1179ac743e8 microblaze: fix livelock in uaccess
> e902e508c5b2 nios2: fix livelock in uaccess
> caa82ae7ef52 openrisc: fix livelock in uaccess
>
> In addition, stable/linux-v5.10 and the older trees lack the following
> commit, despite the Fixes tag.
>
> 50e43a573344 m68k: Update ->thread.esp0 before calling syscall_trace() in ret_from_signal
