Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C27186289
	for <linux-m68k@vger.kernel.org>; Thu,  8 Aug 2024 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723100294; cv=none; b=ENjoJu3UNKbINj+q2pCz9agic5h4k9MyIXdHxD2p3wscbTSkrIto0dCBaJ/Z9VnQXigDygOf+wOpCkDB6TsRC89xnCLXSjaCf0bd8+bbiae8LV4fPErRw0LqbvTnybiUWhDa2qIdcXnO/Z/Pyp72PST7/dtmjIdGykMfcbcyQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723100294; c=relaxed/simple;
	bh=sQz5N9zv1ux2ZDE3pCs52XXHhFEfb5s4mHk61I2BhcM=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IugKnUNnDWhWhE+es4KPMMHrwG4v0AlDKiBToLIXn2NlYz42Ty5PfvQfRYuppYuW+XCifOi78upKYB8C6rhbCKnlU2DfzPvvNThTjPpR0qgBypHgtYtMKfe98m3PlQgw5chMkq795/OUuKz4PgUpf40XjTYCf6N4F65FlqD2Xk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYLV8Ie9; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYLV8Ie9"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70d333d5890so635477b3a.0
        for <linux-m68k@vger.kernel.org>; Wed, 07 Aug 2024 23:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723100292; x=1723705092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HhTYnOYlFjDfuFRlLkZRiAezVFLlxS2aYphzRZcpbo=;
        b=ZYLV8Ie9tWeR0sx4bKjYVbSw9Qe6lq+hLU47wA9zAVZnprNRXU+Xws2rHVh9h/5bSz
         CqF8yZU0RCdb9lkTZK+EFo2OHunQ4+hS5TUXg1KC7uTw9tj/WUmUHf+49C+T7otsqo5l
         hFT50CM484ecdHslYHG1UtuzF0pVCPlIyZiVqSFsTGL9sHdG/PwnC6KVWIIfSQNfGePC
         u4vtY1kphtvKhv3PVdQ/b6Oc00DqbA/qB1ev+NHAZrlVZlMlH1123PEcOQh8OqxzSLiP
         5MZxwj+F478ZGuWxzLK3UAcqj/pP9P7M9AElrruplMc89WPOgQQ70+9xLVMnZ6i2jQgR
         oAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723100292; x=1723705092;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8HhTYnOYlFjDfuFRlLkZRiAezVFLlxS2aYphzRZcpbo=;
        b=Y9VpwSBwKLWGmI0/jgryWWtgZyG9F2fTN2yM82ON+wKG+cjaZ5tgApydKbfmzPFEpJ
         Men3Nz7QIG3PdVD8L4/lghD1Y6HBtdq9cSxQebHf4+Zc6mGUX4Z5eEPbHU8SUwYY1k6v
         5CSxy3pqcUy77HMDsAMT9UprgnTW2ridFFhylrDI7MPk7wQYKK1NpLhat/ZnFBZl5rgm
         IPiwTh+RY53IzKZixFzLEOOGntAzonoXJGoasfdWKK9bYPDiUbf9FSO7+C44C+PJsuEt
         fZSgOs0yOhun2E8M7vAIDjublb1M2nN8+VR+DDRBMMzFb61u+zr1OmffvsRBSiVOPOh6
         x0/A==
X-Gm-Message-State: AOJu0YxnjyAg4QGOZwPK1L/EK0uA2u4ES3RVfOQxal5ybGGhiY/ChcYX
	i/daOrencCs5W17YOJQ4lQQ3Xw1Hlj6C368g+jTWoVyDqqgKye8T
X-Google-Smtp-Source: AGHT+IEoQWEdPv2o5z/l6hT+2L608Ls+RgjSMm2XYLmJ6RMiPXy7LZYkC36NYXrEaLbKaLDZVssE2w==
X-Received: by 2002:a05:6a00:1393:b0:70d:1e0a:e609 with SMTP id d2e1a72fcca58-710cae890damr1116252b3a.30.1723100291775;
        Wed, 07 Aug 2024 23:58:11 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2fd4c5sm533424b3a.212.2024.08.07.23.58.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2024 23:58:11 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Greg Ungerer <gerg@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>
References: <20240429030945.22451-1-schmitzmic@gmail.com>
 <20240429030945.22451-2-schmitzmic@gmail.com>
 <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org>
 <42dfdef0-88d1-4c15-b04b-174f12bd8f3f@gmail.com>
 <de7c9ac4-cb6f-e2a4-59e4-26fd7e260d4e@linux-m68k.org>
 <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <05cd1710-4422-aef5-5bed-8b5968069a4d@gmail.com>
Date: Thu, 8 Aug 2024 18:58:05 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ae5facc5-4b10-481b-9f76-f9b007309d8f@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

Am 08.08.2024 um 18:05 schrieb Greg Ungerer:
> Hi Michael, Finn,
>
> On 8/8/24 11:57, Finn Thain wrote:
>>
>> Hello Michael
>>
>> On Thu, 8 Aug 2024, Michael Schmitz wrote:
>>
>>>> Well, that __clear_user() bug is no longer theoretical. I accidentally
>>>> bumped into it when I sent a ^C to a shell script I wrote to test some
>>>> mac_scsi driver patches...
>>
>> ...
>>
>>>
>>> I'm afraid I've lost track of where we're at with this patch series.
>>> Does it need more work, or more bug reports such as the one below?
>>
>> Apparently the series is waiting for some testing on a Coldfire system
>> with MMU.
>
> Ok, I am in a state that I can do that now (I managed to fix my M5475EVB
> board).
> If I test the v4 versions of this patch set that should do the job?

Yes, v4 is the one to test.

I'll see that I can dig out my test code to reproduce the bug.

Thanks,

	Michael

>
> Regards
> Greg
>
>
>
>>> The previous bug reports might be considered somewhat contrived but this
>>> one's from 'real' user space code, and none too complex at that?
>>>
>>
>> Right. That code was as follows. There's nothing here aimed at
>> arch/m68k/lib/uaccess.c in particular, just IO to a block device and a
>> tmpfs filesystem.
>>
>>
>> #!/bin/bash
>>
>> set -e -u
>>
>> filename=$1
>>
>> rand=/tmp/rand_test_data
>> zero=/tmp/zero_test_data
>> len=512K
>>
>> dd if=/dev/urandom of=$rand bs=$len count=1 2>/dev/null
>> dd if=/dev/zero of=$zero bs=$len count=1 2>/dev/null
>>
>> write() {
>>          dd $args if=$orig of=$filename # oflag=direct
>> }
>>
>> compare() {
>>          echo 3 > /proc/sys/vm/drop_caches
>>          if ! cmp -n $len $orig $filename ; then
>>                  diff -u <(hexdump -C < $orig) <(hexdump -C < $filename)
>>          fi
>> }
>>
>> while true; do
>>          for args in "bs=512k count=1" "bs=64k count=8" "bs=4k
>> count=128" "bs=512 count=1k" ; do
>>                  echo $args
>>                  orig=$rand ; write ; compare
>>                  orig=$zero ; write ; compare
>>                  sync
>>                  echo
>>          done
>> done
