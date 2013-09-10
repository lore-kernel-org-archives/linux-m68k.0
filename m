From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Wed, 11 Sep 2013 00:13:11 +0300
Message-ID: <522F8B67.2080603@aalto.fi>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org> <520D4AE3.6040801@aalto.fi> <520E76FC.9040803@aalto.fi> <11425cb5ec432e2fbb7b675052e8b33d@gmail.com> <520F5F81.7090409@aalto.fi> <52102BEC.7000006@gmail.com> <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com> <52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com> <5211DBD8.5090801@gmail.com> <5212840A.4080300@aalto.fi> <1ef2d87e4efecb2d8c8c2eaf8ac5fd51@gmail.com> <52133E48.50501@aalto.fi> <CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------000109080705050209040200"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx06.aalto.fi ([130.233.222.105]:39689 "EHLO mx06.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751326Ab3IJVNO (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 10 Sep 2013 17:13:14 -0400
In-Reply-To: <CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

--------------000109080705050209040200
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2013 11:34 PM, Michael Schmitz wrote:
> Hello Tuomas,
>
>>> No idea which functions you refer to regarding PIO (reading from FIFO).
>>> Anyway, the DMA will read from the same FIFO that the CPU would, if I
>>> understand DMA correctly. There really should be no difference-
>> esp.scsi.c:1058 versus esp.scsi.c:1120
> I suppose this is because reconnect_with_tag() cannot rely on the tag
> information already being in the FIFO when it is called from
> esp_reconnect(). esp_reconnect() is called from the reselection
> interrupt so the fifo data is already present.
>
>> In:
>> http://pdf.datasheetcatalog.com/datasheet/AdvancedMicroDevices/mXxxsy.pdf
>> page 42: Enable Selection/Reselection Command (Command Code 44H/C4H)
>>
>> explains why the bytes might end up in FIFO; The chip DMA got disabled at
>> some point. Also, you need to explicitly issue a specific (don't know which,
>> yet) command to let the DMA access the FIFO.
> The chip DMA should be activated by the ESP_CMD_DMA bit that is set in
> all uses of send_dma_cmd. I can't see where the DMA would have been
> disabled.
>
>>> The DMA transfer function can be changed to fetch less than seven bytes
>>> from the FIFO by PIO instead of setting up DMA transfer (just poll the FIFO
>>> after sending the command to the ESP, instead of first setting up the DMA
>>> then sending the command),
>>>
>> I'd rather find out why and where the DMA is disabled before we resort to
>> PIO. It is also possible that the chip interrupt is cleared prematurely by
>> reading the interrupt register, in which case the interrupt is not seen by
>> The Loop.
> That's the attitude - my suggestion was purely pragmatic, in order to
> overcome that particular roadblock and see whether there's further
> issues. But fixing this properly would be much preferred.
>
> David Miller is still maintainer of the ESP code - I can't think of
> anyone better suited to answer ESP specific questions really.
>
> Cheers,
>
>    Michael
>
I got it to work. Somehow, at least. I wrote the driver to use PIO for 
command block reads and writes, and found out that it didn't fix the 
problem. Using PIO, only the first byte of the tag message comes 
through. It might not be esp_scsi's fault, but there seems to be an 
assumption that all devices support TCQ. Also, no SCSI-2 features seem 
to be enabled in the chip by esp_scsi.

To cut the long story short, I hardwired TCQ off with a replacement 
function for esp_slave_configure().
The replacement function resides in zorro_esp.c and is essentially doing 
the same thing as the original if ESP_DEFAULT_TAGS was set to zero in 
esp_scsi.h.

There is no need for PIO with the above hack.

I've attached a log of the module loading and some operations on the 
attached hdd. Note that there are messages such as

[ 4627.040000] sd 0:0:0:0: [sda] Got wrong page
and
[ 5106.340000] sda1: WRITE SAME failed. Manually zeroing.

which don't seem normal.

-Tuomas


--------------000109080705050209040200
Content-Type: application/x-gzip; name="zesp161.cap.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="zesp161.cap.gz"

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
--------------000109080705050209040200
Content-Type: application/x-gzip; name="zorro_esp.c.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="zorro_esp.c.gz"

H4sICA2CL1IAA3pvcnJvX2VzcC5jAO07/VPbyJI/y3/FwNbmZGKMDbwkiwNvDTbgt4BZ2yS1
yUupZGlsK8iSVx98Zbm//bp7Rl+W5Jjd26uruqNSwZ7pme7p7+4ZdrbYk+t5nqtxf1E3Dlh3
eM0mnusE29wx2cT1WHtuTXX2qT8Y9NnwZNhj/qMf8Llfr7At+MdO3MWjZ01nAVNPqqz5009v
2L9gM+6x4a17x9SvPvz62XicOqFfN9x6eFstXLnbaDbZpWXMdG6zoTGbW8ETU33x4WeTjy3d
qbvetEpU4frsD5Dp6YHlOixw6RhErOF6HGB3KjuEUhxjHPowYXI86fwgNd3hATdoD88NA8vh
hCuYcXZ1MvjHnvG22WBj3eem5AqhOAFuea5tc88n8AvLCR+QO4oioC51w3OHxLWbIfuoe4uu
M8XNJYXR8vSaETdmjmu7U4v7O51fjll7v/FTs2gF0v3Rs4KAO8j9t2z8yNq27rBzN/SsmQ54
3uvwffbzRLc82wp43eRz1xGyOMLlCxsYMndNa2IZxEKfuRM6Np754aFuMNOz7kCkwFo/XCxc
L6BpojUiYsDvJRkAFfpicaMBi4GiX3TgDnD8X64zZe+/wv+3P9vIqO35m3e3KNcjkkPlB8sx
7BAg39P0DpAV2rw+O8rNWI4VFI8H3PPCReEkqAi3rXnxSnOub8/1xcJypkXTPjAHtrYtv3g1
t/XHogm0MLdwQ1sf43j61Lo/31no06UT0+g00MfLrMAJQzdmfAIynOXndJTQ7L5kAljlEwHJ
nG/41g7+p83c5XMmc4GnOz6qgeYvrDIgk99ZBi/dwvg9i3oTvIaGU/XZZqVy2e/cXHS19s3o
vD9QN5cdw/u8YzjarLaiZZ3u8GTQux71+lfqpvRgKAWy45OfHpgKHqIqtTq17qJ30r0adtXN
s+sLHK78YPIJmmrnsq19HPRGXdZ4eNcQP5WKH4C5GMwPvNAIyJO6mthTM/VAZ98qChirHzAg
3mNbjj7nrYoSOr41dcCJ2GgM7mTi8yA3DLqoxVMgJ6aPfdcOAy6/ErK9lrKzJXdglh/DMN00
Pe77aFHPki7kboq2z1/YIdL3jdWRLPiyefI45t4wcL15b7PG6nLbQzjxZL/RgJGEJjH6jkZj
pDAGXwVh+IU918r2X0bQnEwae3kMMLy/9xIUx7b19KR7JkSTN40CHAWngGH+omPEOJq7e8s4
UDUKUDQaL+NUBkWeWY0yLLvNl2A51f0AAgMv2r7RLDnG/ioUTYkCUFWeWyX2QV5Bs8yUXopP
wdiOtbKiKHUAORQRW7se9Dva9Xl72P2HdnzR+/SpPehozd3dhnby23F3MBz1B5c1XJO2vkOm
Zmyq+qrYEhpfYCkRvh7WvYbW62mn7eHoon3V1T7tSSIgNqfIAQX8eylKUGmXvwBFfxpb80Xn
3/0rB9v9E6z+AL//Asq9/3XS3Y8pigwljlofIP5oo/bxRVeltbUiI6mSZZFJje0nohgt1eNT
yEwwC/1WiZLiO9cGC7Q5iwmjSITgGCJaERxEEYhwcdign8+NBzT4LxhEIrjcNgvd3AXAt5PJ
5EtrHbQwYcxaWbQ0Fq39LLwooX3OnBQ1L3dSZRUubmpG4NkUJQkRzorsOT4gIVKKDtZEADzW
KhzIskaLKUscVC+Hx1XC0FyBAVnX2FsDQzOPIRFSc78cw966GHZXYnhXjmF/XQx7BVy6iLlk
xAKXMJGcxlZAeUyUiR1ffCJFwIzsottBEmH9roJ7n3cyIm6CSUL8orpCFHhYbDDdvtcfIVny
/XDOfeZx3bR3sHaB/NKFwhVKBAYlIJRKARwG6mBIMGnx3ILyZ6EbvAXVD6Rb8O/ew2RNDwAv
RFOq/4ahs/dQY77L7rH0ZA4HkqAkune9Wx3qSqiraXXoALOYzhYeImVAE244QQAqhX6wJqwR
H1voPQh0Vx10z6rs3xWFCFfBNWwfSavw2WtG09XMOjobLPzQvqixaLU4sIqD1Ror24XbPl9F
w5aaSH1vl21V/zQ9psu+sXW3Q1+LhLfYM7ufIbjaQGpBVpNI1n0HJG0za76w+Zw7gaxs+YPB
F0Fc2PdvA33qOjUGqmxC4cfGPLjnUMRiCwG3SZwNSCeYeZxDPRtw6n8gjngDi1Jw1xHzbJtq
YJ0BRRPucczgDQOUXuD1eJ3JulluwIzQQzD7Ee1HFNnc3BBVsUyk7txM2kR8fKdKDwkjbAv+
q7HwHbvT7RrLVhRwkGrlmxT8WCUI4m7EWfgN5OzfXFQhwjzHSGG3BCWKvwhjISaPB6HnkIGN
1XVQRa5CC1IowctoPkjG5nm8xJCtcTjBYKwowmP51hOHHfwnkAmw3bS8NDWII7Wl0C9+V2O4
Cy3CBWmq4nIrIWeaJ0UOpJoEbMufRnThHk44h5WriZqmCELYaM0yTUuaEDqruJRiK/6KaCrh
E0Jn9ksootWFPCqm52VsEtIr41SKrHWZlBWc5f2uLdBDODmyCAHED2PGjVuyfNwh9GPjb1FI
muk+c9zUXJ2MUwFHreZsBE8LO2nDUXt0M6yyVyz6pvWuRgNWhSNL6Tch6kWfGyu4CjGTB5gB
ldHvuBBZwAAh2oA7RS9DQbVsP2Sp6emW89+4n+WAY7Egz83p4Xc3hYAHQUJm58is615fO7ns
lGDzQZbawnI1Y24WeCQIHwhlQDwNhMZT34S8H7lIWCZJqihX/VEX3LIeiNA8CR3RBiaHDh4Z
owXpnOHO5zrgHduucbsB8Q/lj7isGvvaEh8nFB+wNm5J5YgJYUes+aaKaauy8ICcW5Vtxic6
YHDgAzZyXQY4HkWYIdQSKyOsjJpvEFM2/u1sMlD4SI/gE3BRgXOxV4fsP7HFhezDTAlLhijB
RoKIC9VUoRD9UGuOyAWmEiORTXgO5as4kaLIgNsU51CsaFxJH1xZ3lmu2hBAcm2ypMh8yGJO
Ty/aZ7H9nJ5qp8e/jbpDQqhYr1/LD2iCFrJX9OZYlY1ho1sxG1JvFiimr8gksSImRsLiuKQz
S2Ze9p+/vn79ZSXdnfaoLRDKU25vL6FnwNLDREtZhg7rO3wsdmxoZxHRf5E5SyvEnqVa2xv8
yka9y27/ZpTopaKk8DxXctpWrnWR7o56tBFS9cwwGSU6yuFPL26G57Qk1qyYvzQK1qRah42W
9V4AtIBL1XxORZsWSN36kpXuuvZDJ5Ay38jIfJUr+NGUTiAyeQ9SLDcM8HoG5vjDghuQJNYl
w8GJihQYC+ucGxVl0A7LNBd33jToUmm79wFDXJlnJ1+bbjaU+tw4wcg6YJqjheJrsSte2dXY
Mil7hMx/NViVZYsGauOXhRaSCdIsLXFJ3ri3UP2SuBPpSXQueSYp9MQxK5FoKsrxzZnWv1I3
VHLULO2lq1HAEP4ZltHdjmZAdempIvuKkSECKs8iqEXozwqAKgqd7+joEBON7PY0Q8EivuBI
bUuzfxwmlx+4GUlBcFf0bQ4lA4+O2O4++unGw2TSygAKBr8cDmPlOnDs3Rpw9JPAVVZ4EREx
lWKvkI7mR6wR7ShWj04u+h/XXftuee1ltwNrd3bWWp0wJ1p+3qsWn0uo43PW/LGLso7Nx223
v9vmC/p7RTZfBPb/Nv8/ZfPUySuzqWXA3XWNtLmu1TfK3Mj/SXMurHORVZApuN4LCrBt0ZNi
PudzHyfGHCtd7EnCF1EWY+qEVTDtTS3Zwpo1QRpdergLP0UefqM7vnrCD+Uwx6KaBKCsOjNP
IzidtCgy88lwDDRV8hDYc6in+xwZkPRECnBaBEQ7pZLwDExqHMHiEn7pSHIUQeKqPAMSj0Yg
SaGdg0umEJh8l/TfGdAiBx/tTkLObUyjtfTVblb1fFu/A8/lOhNrGnpxByD1GgQ8Or+Ly242
Wq62Q3xcZTng1nUzeoTketbUcnQb4Hn0RMQ4YEUIq6iuM4hu95bHcf+TX+kGQPTafXfOsT87
sRzTpzz6nrSezMEH8KkrGvp1WdgvGRDorY+vYjRI2O9UOMj2EX5F/5DS+kD3pihNvBLcCnDR
KwoyYvwzLbPML7Fpm1yH49+BtPBNjEpdrXhviE1ziDxgRXbopOqNADac2DrERvDV5C7ORlqn
NzzpX111T0ZL5f6Gv7A0fC9l6bZmStJ9+F8SW63mCxlYYd5JqeGCdAuhyO6Xmm2ATANeq8t3
/2zrKd2rZeJ9TMkLgS0O0SyVJMTvkrSAzxc2XtQAhx18nvAqdpPRVCKVIU6du9hqxMWtnGCT
kfwbnq0n08y9zhm7oGOQ0bgi9IJt0HWqeJoDVgIEbXev+pfdSxQzQce9AjB2N/TggMA4L1Cf
KLyYZirJKSCiCpyAKJgM4b5FdeOP8goJ76Sia7bGw4/2AxaJNQaIto/wAUhNnIHF6QfNRA87
RP4jjseQcpyMnyMp8rzRROatUqpMT9YLXK/L98kAZPeT9G1E3Ps95KAAUjGfUkeqZhprv3QH
V1p3MMhwx9AdiH4M/a13x6m9C36H+FNj+tj1AuRSJdZOIiuV1YFUj2+Gv0myIJaeWnjF5JCf
QtIsrNAXFjc4vaFEdRMC3EkF8khD60vuK9NOWppDMeFu6INiK9BtSFhVtIAadfPdSSrmJ5nl
Bnmp7zLnyiV6wfkE1FZosU2y1E0hnIgU8ch24bljm8//Cfwi/kxd8LzgUrWJx7nkj3Bg+GAW
4q80lsSFiVnst4KpI8BbpBcoUfBLytFGPpa8KH7BeWnIXF4E4NCrJ/oodwEHh3wSW2dwtbLz
kA74twCjNtn79yw9QwwEIQ/vLSx04YAoZgM4Bvyhz5gPRU+FsUFrUIN2QkrqGI91IXexXGVk
w+DWSBQGsOV772wOlsoQyJ0y4TyrMAXhHCUjKhykCcB35dtFnIh7c8/fpyb9FOdPUZXuHOWo
2i+hCuo3PbQDgRAE0Z9BVspF7rlSlW+SG1RhwxsZPZ3olk2Kqkk1ymB9jhRIpKqvMieNbEr6
tiPK2PGnGh1KVqyW63FMDx2XKjU1ihWNh91Gqt5KL1GpAtc0C/KUOfj8T6OPfe1Du9MZyNWJ
RcfLqmVnIs294MF/+DJ/h1wHk3ympzuADw28nrXtR7rcouflyFzEoUbqerj2I60q++MP6li/
aO1ar62qyyV5ppKiSq9/ddo7a2rX3St8QMX+YG+rsgY8PRPd7dKLugQMu7Ol21G3tkSFnksV
Q2jvDuuxaYjhGB1H9PaSfdpj9xhDxlzkunjbhDkqll3UXkOn9U+xwTkkqyBOnUH0MPjMtU0Q
J5Zljntfr9ejA75cbuJcmQ5KgQZHac5yrCnsw1bpBkAkA5X83itUXWJZ0vW4s5PRd1GB4Xjs
9TO9HMBEnQOMkxBLZ/QQI3V73HwjrwaVV8WNoGj67PRaQ0/TvViiK7OiiLiI8FYcEKEkBLp6
g1+19mXvrK1d9wcjvM8SeWOU4ACUGsPXkosFcHogAVh9qg3P24NuR96dZ565gwJvUkeoKrs/
uPd71ijwFpkD4POrHcFHUV2I4gKv4LC6QEPQhr9dnUj3EklbxMWZtSDnIc4RExwBCUOTQTpF
VwFNcGLEICyVSmPvDtMoTPdkNpBuPlQyKw8qSvQxzUDBjErJwQ/EAwM5UaYnrKBdWDpBfcQI
Y1YXDlbEEMsl2Hw/c0nh194jsz72WAcyHxVpVhhEWVYlyuEOIv57HN+28TjjTjMfi5xO98PK
NwtzF/LYklIwXdwtVWlxFjFNyz9ba1PxVpgsprLt0ElrYJTTdSwf/5qGxX8t5NfZNfdm+oKa
EMwU86hFcT8CfKx48FGuX3+bFgnXnmTUKYmzqForVpxidRB3qsUqUC74XJsvXarm/tBE9vmw
NlOwCkwytG1EvEl9M1OjP2vKJI3xU2eEwEpDrM+3F0RLDTVsCSBRu1y7SqPV6RSVsn0Yo6CU
fpYV8UGojzyVmnvWnX8JpWn8IY8DxxIcYjLRzu9sL/4QTtBZQDsASQjCUoAZIP4LVIo8PO85
AAA=
--------------000109080705050209040200--
