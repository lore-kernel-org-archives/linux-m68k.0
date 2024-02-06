Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA21C1CFA9
	for <linux-m68k@vger.kernel.org>; Tue,  6 Feb 2024 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707255436; cv=none; b=uYz0MZt3TtE1BDB/6DUG34+7gJc8eO3CWmenIU5OzZPepIVK7DUmbQzP6f5XDRla+ichw0+58piKIGfh4CZRtncDdzCmZ0OY03TrkJSyhbgQSVORhw9TGyPDwZRdlxowTugKwrnwH9O10RF7LrVO5R+fiRcd6RxX8NtMiYu4UZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707255436; c=relaxed/simple;
	bh=v59Lzkgd1pAU/+Jsx/5WM4/iT3zgYsEPCCKHpm/i4z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BRYoWPE+KSowV7VYjB2r0oyvHhHvufh/KZzLdYt3MBor7AMu9SmibpXJRnQPRgzG0xkVTuSqNgiP7vt1vo5dmuAVLugW4hRe0wWM2sfrx5yuceMLt+2E4BSOQL/hHdGgL1gb+KJla9p1VJMkBFSqOhFom9u+gQRO8DyAThBp6lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaXp0NLB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaXp0NLB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d7354ba334so53003065ad.1
        for <linux-m68k@vger.kernel.org>; Tue, 06 Feb 2024 13:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707255434; x=1707860234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THnSb0acR2Pn80Zsv+38O4Ghf3iU02oRgiZOG1MwHKA=;
        b=eaXp0NLBEysSr478Cxk09EixA4X9c3TMzK1qQZU7/GnQRZmlTWzHNEgPIcyxPBfNkM
         vIf5yrQk5hYRlL5Nd3fpdCvrMFc6cm4UqnwKhfAdQbWBodE2yHdXoeklQadY5xCgjTpb
         loeucB+w/rK9Q4NdbL4OIwwlHYck0K1MghWZo0LZEND9VCQlZjeR0EOxrzoFtbFJnyc6
         yTmsIPRHRKxHOkrACD59eiRK/6WdPBs7lJKo3p6kQ2HTAOyZMiEu+V+non2u0+LdWdsK
         T/9z1HgQYtFqBhxWC4rMCfG8Du8gxTuKCPgulPUzNtMWayFb6JB+F7mgcT1i1mADDmSD
         WC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707255434; x=1707860234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THnSb0acR2Pn80Zsv+38O4Ghf3iU02oRgiZOG1MwHKA=;
        b=J/pc7YR4cWiQif9B0QN9pkF9GBTKhDaTa6pkWKFkyyKWkBs2S6twZg+zBg/K/Bhc9o
         lC+Gi7xm4fPssFiYf800ygHG+2CQoyVFOxtN+2it6mk1KRg8B8B1NpJvRAsHEar/sM8w
         Havxk0rlCPl864kxPVSJ0ZGQOTmbN74cz+8NDE74bQ9iHb8HOq+1Ykq8gsaPx85mC/1e
         PAm2Op9v6+YFOSVBhNTU6WyH8H7x6IXqNxHLv54CM3uM22muRlxj8tWOG9+Wz32QuZYr
         toidfChJ+K9J9oSogRWBDmYaOzoDvVeso7WnM9iVqxK3+rVTValAUxQ/vtOqHvYzxSMT
         8hDw==
X-Gm-Message-State: AOJu0YyMRmY6f+U7RnlxJa8L/p8SVv5BraH6e2xohxW2d4uLbO0FnVl6
	dYR+JbRPQqQ+zlFkBXZxqIKRgSB68jcIR5+ofoB4UJF+eAItuszZ
X-Google-Smtp-Source: AGHT+IGfzPTC8Tw+NSbYvLYtY2nCKvtb6nsOKI4rTC9JIMmuXFkafSLSfONQoRm5Tu8l6C/3iHnwBQ==
X-Received: by 2002:a17:902:7448:b0:1d9:bbc2:87e7 with SMTP id e8-20020a170902744800b001d9bbc287e7mr2823054plt.36.1707255434179;
        Tue, 06 Feb 2024 13:37:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVHgEY5l/tRXGusXsT0AFJILrjtYJ3JsbjRXNleMiV+74p/XDRlj5SfnSOtyuVGHdRBSE92JHM8E/r4ikK8EAtaNxiGusIeUgheWonXvjReSbsXaBx1qUZEE9NVGBSFtMV0WViL1jP6KRg4gsMZAkRsxmbDPwPh2Hn/KXAaBpTQqHheCEOMZz5e
Received: from ?IPV6:2001:df0:0:200c:adb8:c71:a09c:347f? ([2001:df0:0:200c:adb8:c71:a09c:347f])
        by smtp.gmail.com with ESMTPSA id kf6-20020a17090305c600b001d8f82f90ccsm2343721plb.199.2024.02.06.13.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 13:37:13 -0800 (PST)
Message-ID: <1ec6b945-4eba-4cf6-8ca5-3db88b7f92de@gmail.com>
Date: Wed, 7 Feb 2024 10:37:08 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] m68k v4.4 backport fixes
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, uli@fpond.eu, fthain@linux-m68k.org,
 viro@zeniv.linux.org.uk
References: <20240206211104.26421-1-schmitzmic@gmail.com>
 <1ff0280f69c02b4e64e1a1055c9411ecbff9ffc0.camel@physik.fu-berlin.de>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <1ff0280f69c02b4e64e1a1055c9411ecbff9ffc0.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Adrian,

On 7/02/24 10:15, John Paul Adrian Glaubitz wrote:
> Hi Michael,
>
> On Wed, 2024-02-07 at 10:10 +1300, Michael Schmitz wrote:
>> IP v4.4 backport patches for m68k. Basically everything needed
>> to make v4.4 work on my Falcon. This includes my iounmap() fix,
>> Al Viro's signal handling and uaccess page fault fixes, my 030
>> buserr_c fix for exception handling during page faults, and Finn's
>> 030 signal frame fix.
> Correct me if I'm wrong, but 4.4 is no longer maintained, is it?
>
> It seems that the last LTS release for 4.4 was 4.4.302 [1].

That is correct. You will note that none of my patches did contain a Cc: 
stable@vger.kernel.org tag.

This is about CIP releases - see 
https://wiki.linuxfoundation.org/civilinfrastructureplatform/start for 
more information. EOL for the CIP 4.4 kernel is projected to be 01/2027. 
That's still some way off.

Cheers,

     Michael

>
> Adrian
>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tag/?h=v4.4.302
