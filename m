Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56235152E18
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Apr 2024 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712167907; cv=none; b=igV/u3WU9OvXGyU9APwSdElt1PSxwBG4exy3HELPstwSbvKuLDjO749NxySa9EqSC0iYYtSB2z/pn+l7S19YFUmj1lMgBNg5K24bBEd9F9i+au/PEONPmKs3WcET+V0hxvnhGYdgHtjsUsxF0Bn7OJmdTbX+IXC5Yua+y4M1y5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712167907; c=relaxed/simple;
	bh=aZ5mAysNCnvwmuu/IMWuw+Al5q2n+CRYz1OcIPZ+NAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLIuB2FSM9z7+MAaKcR2c5HKreFy2To6sKfaRLmcchcnsqlXH8pcSHJr8jLmKdLKUayyvnqS59rZiFcAItyo0yYRgPL87MfSc3yfnNtgQOnq3LHOQcLX+1zV8Z/ajxnhzHiCXVKqYBD+8PeffEXH9b4AyR7wR6cV5+u1s/HNF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2B4TN8y; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2B4TN8y"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6f4ad4c57so66825b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Apr 2024 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712167905; x=1712772705; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wNqoKw8FaZxTWz4HMAlSRjVC+URzh8zm927c6ywQr4=;
        b=X2B4TN8yb2IBHo2IAT49IYli0XDqC7g4EnJcQbyyyEnxKvvYo2oRZ/JM3EKET72Ngc
         kZZ13BFIc/yLIp2yc5sWMbV9ZqZEgasSq7kCSXYZv0rBvhYJa2+zPCN8s2ZVmrk3ScuM
         avarqwGs8CnjoNdGT9FAbw1/Nromj2XVOJ58Dj8fmrSd6gh+DNidG7MKRrJqI/OYq57J
         Z3p9yszN5NJAKuuG0aTUXSnvjVLv3W79xwhsVjfS4RbwIoqlDrgdOP9iiule7dIQiEhA
         FM/dYFIvUswYhW755b7VgIC0zmrj2oWY7fff3sY1TQWWJ/yxX5y+rocPluClFxUU77Ux
         AruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167905; x=1712772705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wNqoKw8FaZxTWz4HMAlSRjVC+URzh8zm927c6ywQr4=;
        b=wUysMbR+pq6GCvJSyqYAql3IbwtBNpEJUR/pmhr1a/pH65F2wV1wkfBHPnDHHdP5ZL
         +7p5i2V1e7ZU06vWkEpiT+9D8A1Bloimbz0SF/HM5S8q1sBArK47qWCUNdj2s75kFjAY
         CGoZ2/liHO/nAxllWV4QbcqTPIfjjyUCWLy8i5MFWtgWUxpdL70BdNcHbfH4ZONR5GR7
         3FUY0fbiEl9wsrO74rTXtuwMTGsrPP8H4Rz/wjxFOS7sfRK3FOSxo74e4Ii5a+JlQmO9
         fQ/i1eSf5jZ2hRnse+8Au3r2ESE/MTtmjO75PqDOPwLqXIcc4zfFXlQjCU/4yq7aRX/T
         S/zQ==
X-Gm-Message-State: AOJu0YzvrTcJKKzneHYQr4PX9VzeRP0U8FxTkmmY0uhq0RkbgyWb8QwR
	VA/olE9NhsYzJ8zad7tcyiIQcMbTS4dbEjhYJsU4krO1CkScljgQ
X-Google-Smtp-Source: AGHT+IHH8OsExZMIlURZDq/TmQnHeLrzwE5Tgu4BThsGQRIhPvZFnUOtT+RHiYmgFIJomzgYt3dfXA==
X-Received: by 2002:a05:6a20:a123:b0:1a7:186:bec3 with SMTP id q35-20020a056a20a12300b001a70186bec3mr521873pzk.57.1712167905539;
        Wed, 03 Apr 2024 11:11:45 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902650e00b001e2936705b4sm1914313plk.243.2024.04.03.11.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 11:11:44 -0700 (PDT)
Message-ID: <dd55afa6-8cb6-4e25-b720-d2df62dbb5e6@gmail.com>
Date: Thu, 4 Apr 2024 07:11:41 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] m68k: Handle HAS_IOPORT dependencies
Content-Language: en-US
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20240403122851.38808-1-schnelle@linux.ibm.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20240403122851.38808-1-schnelle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Niklas,

how do you propose we handle legacy drivers that do depend on 
inb()/outb() functions (_not_ actual ISA I/O) on architectures that map 
inb()/outb() to MMIO functions?

(In my case, that's at least ne.c - Geert ought to have a better 
overview what else does use inb()/outb() on m68k)

Cheers,

     Michael

On 4/04/24 01:28, Niklas Schnelle wrote:
> Hi Geert,
>
> This is a follow up in my ongoing effort of making inb()/outb() and
> similar I/O port accessors compile-time optional. Previously I sent this
> as a treewide series titled "treewide: Remove I/O port accessors for
> HAS_IOPORT=n" with the latest being its 5th version[0]. With a significant
> subset of patches merged I've changed over to per-subsystem series. These
> series are stand alone and should be merged via the relevant tree such
> that with all subsystems complete we can follow this up with the final
> patch that will make the I/O port accessors compile-time optional.
>
> The current state of the full series with changes to the remaining
> subsystems and the aforementioned final patch can be found for your
> convenience on my git.kernel.org tree in the has_ioport_v6 branch[1] with
> signed tags. As for compile-time vs runtime see Linus' reply to my first
> attempt[2].
>
> Thanks,
> Niklas
>
> [0] https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.com/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/log/?h=has_ioport_v6
> [2] https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
>
> Niklas Schnelle (1):
>    m68k: Let GENERIC_IOMAP depend on HAS_IOPORT
>
>   arch/m68k/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
