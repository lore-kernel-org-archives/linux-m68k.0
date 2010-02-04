From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: m68k/for-2.6.34
Date: Thu, 04 Feb 2010 23:54:04 +0300
Message-ID: <4B6B33EC.9000102@codesourcery.com>
References: <10f740e81002011212t91a087bkeb77dac23f5676e0@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <10f740e81002011212t91a087bkeb77dac23f5676e0@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On 2/1/10 11:12 PM, Geert Uytterhoeven wrote:
...
> Should I add the NPTL support for m68k and m68knommu, or shall I wait
> for 2.6.35?

Notwithstanding the bias, I think you should merge the NPTL support. 
The NPTL changes don't touch any of the existing functionality, they 
only add the new syscalls, so the risk of breaking something is negligible.

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
