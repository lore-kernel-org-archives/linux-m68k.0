Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EB4AF674
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Sep 2026 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552253; cv=none; b=fkdCGY5NUIXrjdB9CXK7uJXg1S9yO6YEJuTFk8QPV4Oci0jdrd0H0H1SWu6qCAaRi/BiTlpAyztEqG5e6E1bTk7D44neiUJzXszjWwWkoWdDgwxin2M1MKLKr5pI5aLGJajMOFaOmbEZkcycgksogIbSik0gK/jTRU0bVSAjAow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552253; c=relaxed/simple;
	bh=zVftL0e6KTn1Fup/RmgkkUqXURXldH56P13A6WLi8KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEOKMBAKRNqOBFEyeI+MFqY3gzQK6228ltcB57LozMj5IyhWUvJe1a6JrZZxOOx9g3n7/3tS5h+Tr+22U1XwHQPTs5ZdLLQl5sOo9faHgRXMvB94YvRnxdE7GA3ImRH8k0v9HusP9wOjZSfni4XDhRWyOMuV+dAvs7T/8TD6uMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fka32g+x; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fka32g+x"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so4413245e9.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Sep 2026 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789552219; x=1790157019; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=79YAdtaHEv3S3nDvYc6X9C5ar06F3FncZEtUncQdJQ4=;
        b=Fka32g+xPjQyRBXN5YW5yeKqdetWx+2oulXIRdAWP0O7S5a9IQNRk6PhCt20HvXjnm
         ugTPvq9a6XUXLzJcmql3MRLv+/QRx+lDRiz5WB6X417UK/jtauZMplZGwbSZHcA2HMyH
         EQ9XEtZXR1+oReil7RAanl8Y4yroS+FTmTWhXKYcUyI1GnNMlKg6sEvP26Q+lyU9PVXH
         Wrtu2AXgmHiCGidgb8Q5+L79kMwV0OBB09IDDgBQhlI4ia2Mg9o4ptPcUkH0jJAqGgzF
         BKjefZUlJqOazD0+yjDknN6o7kKHT11p1mCoFSAEuCzZMjoSc5TiavCRqpv4QJYh7Uub
         STCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552219; x=1790157019;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79YAdtaHEv3S3nDvYc6X9C5ar06F3FncZEtUncQdJQ4=;
        b=QjsgWnbsBZgl7l6FzAXsHV8qscQgS5U93yVDO7p+Av5xnDp+SJfoSTofp1x68cuuqk
         Z/LzgTtffYjfrVVmKTjYVsY1/No48uybydMC7C3ZgzkK5r/PFl1RBx56y/aVLoHJiQck
         DF+lAYbbJ+NTntoqmkOdZ20+89cTMGT+11K2hzuRhSvDKi/xQPYgKv3SgUDswE6GUxkL
         ZmtQwbXqKS+7sNopSxc4XHdk1FCMUUNv45IvO48mAPUXvVuZGieKQJE3uCMNnA+Ozj53
         VhVxr8T5Rf4+hz3wzWxVSBouiXln1bqzIuHvh5yxTxYEZV0Ki6wdCwavgvjOc6cxivF4
         clTg==
X-Forwarded-Encrypted: i=1; AKwUvBwH6E4pJ4jwgm4EzRejVpxn3WBrL9Oy5/ZkRTsqwhAb42li0d5++hjiSA9PmZDm3S/jsUNAQYKHAyEc@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mT7FKl37yySoBBMluPoPGlX6wSJq86HXAx5bpXomZhkrb+ucg+
	wETUMat3k8Yq3R/kELhJvOrSXOZdWd+y5qjGe5eb5HAwBZqGNIAk8pch
X-Gm-Gg: AYBFou3jvDd0hBe+f+XB4HaCIsDkpb9VP5b1iYfHIwy1YF9OAHSL9myLmAyXmvD0yqO
	DZdx2ght8BVRNmab53fjK/4i2Dnnr8olYk0/wWn7ox0CVmD6RPLIh/RCrc5f0goRnhiSVkfPeJN
	MA1dlY+ng6LypCOnazZLf83ZhoMYaPOUddwnSat6Ezebil9z4xZxtA1RikPhjok7Q7JUPvhaD7r
	+L3vkQn+oI/Fd9vDoooiXShfzmqb/HZLLBqM1jFTu4J/MEvvWHzW9N8D9jH5mJ0HMEpZ1A3jS2Y
	Dpmcubwo5ZWx85TmPQfnBv3AQEodrsOXMxk3qrZ8gintrR9i9yYiMI6AQscYoyZyVOLCTiRAi5F
	RaBM41tZBJ1LvHrHsb6HmjQUfOyMkxF39O1WjcAjVALr6ZzjIXNzV5eynmb025XPMtruBpilLnd
	eUwbplfSj3xmf38gf2ELAs2mIm8DgCA7FGV8vTkjINTAWB6icBiCeq0GFmZpkDKYetb9NyLUU0B
	zyyVU/xorbJ6Yb9o1zIe/AFZXHOv5lIqr5xsrU3OygZE3w=
X-Received: by 2002:a05:600c:4ec6:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49eb732aec0mr19444455e9.24.1789552219000;
        Wed, 16 Sep 2026 02:50:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b02245sm84055225e9.10.2026.09.16.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:50:18 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:50:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jann Horn <jannh@google.com>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, Jens Axboe
 <axboe@kernel.dk>, io-uring@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bpf@vger.kernel.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
Message-ID: <20260916105017.13ea5e36@pumpkin>
In-Reply-To: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
	<CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
	<CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 12:08:57 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
> >
> > Is this mainly about stuff like "we installed a file descriptor and
> > then the following put_user() failed"? Because if so, I think a nicer
> > fix would be to have a policy of "if userspace provides unwritable
> > memory to a syscall, just keep going and pretend the access worked",
> > and maybe have a sysctl that kills the process when this happens to
> > emphasize that userspace should not be doing this.  
> 
> We've done that before, where we just ignore put_user() errors and the
> user gets whatever the user gets.
> 
> It is maybe not optimal, but it's fine. You can find quite a lot of
> unchecked put_user() calls with a pattern like
> 
>         git grep '^[[:space:]]*put_user(.*);'
> 
> and some of them are in core code - see the two in kernel/fork.c, for example.
> 
> One of them says "if userspace has not set up a proper pointer then
> tough luck". The other one doesn't even bother with a comment.

I think the code should try to return EFAULT (IIRC that is too hard
in one of the exec cases).
Otherwise very unexpected things might happen if the memory is just
readonly.
If you ignore the error and the pointer is invalid the application will
get a SIGSEGV and (usually) die.
But winding back kernel data because a user copy failed is likely to
be problematic/difficult and at best have error path code that isn't
really tested.

As well as writing fd numbers to userspace, some sockopt code tries to
wind back if the write to optlen fails (which has been read earlier).

I've forgotten which Unix converted EFAULT to SIGSEGV in the system
call exit code - I'm sure one of the ones I've used did.

David

> 
> The scheduler has two cases too, although one of them is admittedly
> for another error case.
> 
> So yes, saying "if you pass bogus arguments, you get what you get" is
> a valid model. It's perhaps not the *preferred* model, but it's not
> wrong.
> 
> It *would* be wrong to take code that already has error handling and
> remove the error handling, though.
> 
>                   Linus
> 

