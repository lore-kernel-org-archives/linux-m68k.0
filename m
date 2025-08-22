Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B923D7D4
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755880991; cv=none; b=Lz50zBl88Zj4Tgstrel57hFRQeqhlS3S/XYmEkYhTpga/KmJIxrcGHdrDNrSA9fKZe1LCs7kyGa38EBlRUA9591erSo3LQv2eVAJrQcUmT9Q9oupIYWGcb8uNF/38DVsHMKb/DRu0CdNAgCJks0FOAALqGL38a03+Q+EziQr/2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755880991; c=relaxed/simple;
	bh=sbkgRerZZYWx+d6GOFqRt53IRDQ24TjfaP7Il3sRTDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTKAGh2fmb2Posne126UVqU+iIvIgHhv4j679syjo2SQRkHSxUtZzdF6iAL1JKci7jVyDw06Dc4/+rNFl39DqJC0++U0qI6QPISKj7C3VG8VU1WPnZFvv65mOjv2kwpQGW6ovWlEXSagKdAnfo1Olh7oIxoZscHFy28PHDc8TDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HwpUT0Du; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HwpUT0Du"
Message-ID: <d0fe3163-32d9-4d81-81bb-d964f2f43f17@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755880976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2db9JdZXTb0V/RVvHgckUl90Ob/dJqVvYc/vJjsr560=;
	b=HwpUT0Du+pjHmHRARCl7IT7o3CwGDo4y+KffQulAZGCKv1kwyB+7djLBiy5q69zn3ytYiS
	hDn7EL76eASVhtgD7MVOnBVm3SHg2vaAeY6zh0OyTQAmmdl2D6IMMRrQfYacQ8PWWRsKhA
	dzklEaYJuk9/I+tUnEAa6frcghMbnLA=
Date: Sat, 23 Aug 2025 00:42:48 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/3] hung_task: show the blocker task if the task is
 hung on semaphore
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, mhiramat@kernel.org
Cc: akpm@linux-foundation.org, will@kernel.org, peterz@infradead.org,
 mingo@redhat.com, longman@redhat.com, anna.schumaker@oracle.com,
 boqun.feng@gmail.com, joel.granados@kernel.org, kent.overstreet@linux.dev,
 leonylgao@tencent.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 tfiga@chromium.org, amaindex@outlook.com, jstultz@google.com,
 Mingzhe Yang <mingzhe.yang@ly.com>, Eero Tamminen <oak@helsinkinet.fi>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Lance Yang <ioworker0@gmail.com>, senozhatsky@chromium.org
References: <20250414145945.84916-1-ioworker0@gmail.com>
 <20250414145945.84916-3-ioworker0@gmail.com>
 <CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com>
 <da53a828-137a-4efc-a192-a2b49a06d050@linux.dev>
 <CAMuHMdVTBSq2D+-rzGTr+Fz52sDFeeApUcG=LdDYBO5sY+rQxQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAMuHMdVTBSq2D+-rzGTr+Fz52sDFeeApUcG=LdDYBO5sY+rQxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

@Masami

On 2025/8/22 23:37, Geert Uytterhoeven wrote:
> Hi Lance,
> 
> On Fri, 22 Aug 2025 at 17:18, Lance Yang <lance.yang@linux.dev> wrote:
>> On 2025/8/22 15:38, Geert Uytterhoeven wrote:
>>> (this time the right email thread, I hope ;-)
>>>
>>> On Mon, 14 Apr 2025 at 17:23, Lance Yang <ioworker0@gmail.com> wrote:
>>>> Inspired by mutex blocker tracking[1], this patch makes a trade-off to
>>>> balance the overhead and utility of the hung task detector.
>>>>
>>>> Unlike mutexes, semaphores lack explicit ownership tracking, making it
>>>> challenging to identify the root cause of hangs. To address this, we
>>>> introduce a last_holder field to the semaphore structure, which is
>>>> updated when a task successfully calls down() and cleared during up().
>>>>
>>>> The assumption is that if a task is blocked on a semaphore, the holders
>>>> must not have released it. While this does not guarantee that the last
>>>> holder is one of the current blockers, it likely provides a practical hint
>>>> for diagnosing semaphore-related stalls.
>>>>
>> [...]
>>>
>>> Thanks for your patch, which is now commit 194a9b9e843b4077
>>> ("hung_task: show the blocker task if the task is hung on
>>> semaphore") in v6.16-rc1.
>>>
>>> Eero reported [1] two WARNINGS seen with v6.16 on emulated Atari.
>>> I managed to reproduce it on ARAnyM using the provided config (it does
>>> not happen with atari_defconfig), and bisected it to this commit:
>>
>> The two warnings are directly related, and the first one
>> is the root cause, IIUC.
>>
>>>
>>> ------------[ cut here ]------------
>>> WARNING: CPU: 0 PID: 39 at include/linux/hung_task.h:48
>>
>> The first warning at hung_task.h:48 is triggered because
>> WARN_ON_ONCE(lock_ptr & BLOCKER_TYPE_MASK) check fails.
>>
>> static inline void hung_task_set_blocker(void *lock, unsigned long type)
>> {
>>          unsigned long lock_ptr = (unsigned long)lock;
>>
>>          WARN_ON_ONCE(!lock_ptr);
>>          WARN_ON_ONCE(READ_ONCE(current->blocker));
>>
>>          /*
>>           * If the lock pointer matches the BLOCKER_TYPE_MASK, return
>>           * without writing anything.
>>           */
>>          if (WARN_ON_ONCE(lock_ptr & BLOCKER_TYPE_MASK)) <- here
>>                  return;
>>
>> This logic assumes the lock pointer is sufficiently aligned,
>> allowing the lower bits to be used for the lock type. But it
>> appears we are being passed an unaligned lock pointer,
>> unfortunately.
> 
> Thanks, that gives me a clue...
> 
> include/linux/hung_task.h-/*
> include/linux/hung_task.h- * @blocker: Combines lock address and blocking type.
> include/linux/hung_task.h- *
> include/linux/hung_task.h- * Since lock pointers are at least 4-byte
> aligned(32-bit) or 8-byte
> include/linux/hung_task.h- * aligned(64-bit). This leaves the 2 least
> bits (LSBs) of the pointer
> include/linux/hung_task.h- * always zero. So we can use these bits to
> encode the specific blocking
> include/linux/hung_task.h- * type.
> include/linux/hung_task.h- *
> include/linux/hung_task.h- * Type encoding:
> include/linux/hung_task.h- * 00 - Blocked on mutex
>   (BLOCKER_TYPE_MUTEX)
> include/linux/hung_task.h- * 01 - Blocked on semaphore
>   (BLOCKER_TYPE_SEM)
> include/linux/hung_task.h- * 10 - Blocked on rw-semaphore as READER
>   (BLOCKER_TYPE_RWSEM_READER)
> include/linux/hung_task.h- * 11 - Blocked on rw-semaphore as WRITER
>   (BLOCKER_TYPE_RWSEM_WRITER)
> include/linux/hung_task.h- */
> include/linux/hung_task.h-#define BLOCKER_TYPE_MUTEX            0x00UL
> include/linux/hung_task.h-#define BLOCKER_TYPE_SEM              0x01UL
> include/linux/hung_task.h-#define BLOCKER_TYPE_RWSEM_READER     0x02UL
> include/linux/hung_task.h-#define BLOCKER_TYPE_RWSEM_WRITER     0x03UL
> include/linux/hung_task.h-
> include/linux/hung_task.h:#define BLOCKER_TYPE_MASK             0x03UL
> 
> On m68k, the minimum alignment of int and larger is 2 bytes.

Ah, thanks, that's good to know! It clearly explains why the
WARN_ON_ONCE() is triggering.

> If you want to use the lowest 2 bits of a pointer for your own use,
> you must make sure data is sufficiently aligned.

You're right. Apparently I missed that :(

I'm wondering if there's a way to check an architecture's minimum
alignment at compile-time. If so, we could disable this feature on
architectures that don't guarantee 4-byte alignment.

If not, the fallback is to adjust the runtime checks. We could change
the first WARN_ON_ONCE() to a simple if that returns silently for
unaligned pointers. Then we can just remove the second WARN_ON_ONCE()
in hung_task_clear_blocker() altogether.

static inline void hung_task_set_blocker(void *lock, unsigned long type)
{
	unsigned long lock_ptr = (unsigned long)lock;

	WARN_ON_ONCE(!lock_ptr);
	WARN_ON_ONCE(READ_ONCE(current->blocker));

	/*
	 * If the lock pointer matches the BLOCKER_TYPE_MASK, return
	 * without writing anything.
	 */
	if (lock_ptr & BLOCKER_TYPE_MASK)
		return;

	WRITE_ONCE(current->blocker, lock_ptr | type);
}

static inline void hung_task_clear_blocker(void)
{
	WRITE_ONCE(current->blocker, 0UL);
}

This would fix both warnings and let the feature gracefully do nothing
on architectures like m68k.

Thanks,
Lance
